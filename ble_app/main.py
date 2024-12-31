from gi.repository import GLib
import paho.mqtt.client as mqtt
import bluetooth_utils
import bluetooth_constants
import dbus
import dbus.mainloop.glib
import json
import sys
import time

sys.path.insert(0, '.')

adapter_interface = None
mainloop = None
timer_id = None

mqtt_server = "127.0.0.1"

devices = {}
managed_objects_found = 0
current_device_address = ''
current_device_interface = ''


led_info = [
    {"name":"Light 1","status":False,"controller":"ble"},
    {"name":"Light 2","status":False,"controller":"ble"},
]

def read_characteristic_value(characteristic_path):
    bus = dbus.SystemBus()
    char = bus.get_object("org.bluez", characteristic_path)
    char_interface = dbus.Interface(char, "org.bluez.GattCharacteristic1")
    raw_value = char_interface.ReadValue({})
    print(f"Read value: {raw_value}")
    value = bluetooth_utils.dbus_to_python(raw_value[0])
    print(f"Read value: {value}")
    return value

def write_characteristic_value(characteristic_path, value_to_write):
    value_to_write = int(value_to_write)
    bus = dbus.SystemBus()
    char = bus.get_object("org.bluez", characteristic_path)
    char_interface = dbus.Interface(char, "org.bluez.GattCharacteristic1")
    byte_values = [dbus.Byte(value_to_write)]
    char_interface.WriteValue(dbus.Array(byte_values, signature=dbus.Signature('y')), {})
    print(f"Wrote value: {value_to_write}")

def list_devices_found():
    print("Full list of devices discovered:")
    print("------------------------------")

    for path in devices:
        dev = devices[path]

        if 'Name' in dev:
            print("Device Name  :", bluetooth_utils.dbus_to_python(dev['Name']))
            if bluetooth_utils.dbus_to_python(dev['Name']) == bluetooth_constants.DEVICE_NAME:
                connect_to_device(bluetooth_utils.dbus_to_python(dev['Address']))

            print("------------------------------")

def connect_to_device(device_address):
    global current_device_address
    global current_device_interface
    found = 0
    for path in devices:
        dev = devices[path]
        if 'Address' in dev:
            dev_address = bluetooth_utils.dbus_to_python(dev['Address'])
            if dev_address == device_address:
                if 'Name' in dev:
                    dev_name = bluetooth_utils.dbus_to_python(dev['Name'])
                    print("Device name: ", dev_name)
                print(f"Found device at address {device_address}. Attempting to connect...")
                found = 1
                break
    
    if found == 0:
        print(f"Not found device at address {device_address}")
        return

    bus = dbus.SystemBus()
    adapter_path = bluetooth_constants.BLUEZ_NAMESPACE + bluetooth_constants.ADAPTER_NAME
    device_path = bluetooth_utils.device_address_to_path(device_address, adapter_path)
    device_proxy = bus.get_object(bluetooth_constants.BLUEZ_SERVICE_NAME, device_path)
    device_interface = dbus.Interface(device_proxy, bluetooth_constants.DEVICE_INTERFACE)

    try:
        device_interface.Connect()
        print(f"Successfully connected to device {device_address}")
        current_device_address = device_address
        current_device_interface = device_interface

    except Exception as e:
        print(f"Failed to connect to device {device_address}")
        print(e.get_dbus_name())
        print(e.get_dbus_message())
        if "UnknownObject" in e.get_dbus_name():
            print("Try scanning first to resolve this problem")

def reconnect_to_current_device():
    print(f"reconnecting to device {current_device_address}")
    try:
        current_device_interface.Connect()
        print(f"reconnect to device {current_device_address} successful")
    except Exception as e:
        print(f"Failed to reconnect to {current_device_address} first time")

def interfaces_added(path, interfaces):
    if not bluetooth_constants.DEVICE_INTERFACE in interfaces:
        return
    device_properties = interfaces[bluetooth_constants.DEVICE_INTERFACE]

    if path not in devices:
        devices[path] = device_properties
        dev = devices[path]
        print("NEW path  :", path)
        if 'Address' in dev:
            print("NEW bdaddr: ", bluetooth_utils.dbus_to_python(dev['Address']))
        if 'Name' in dev:
            print("NEW name  : ", bluetooth_utils.dbus_to_python(dev['Name']))

def interfaces_removed(path, interfaces):
    if not bluetooth_constants.DEVICE_INTERFACE in interfaces:
        return
    if path in devices:
        dev = devices[path]
        if 'Address' in dev:
            print("DEL bdaddr: ", bluetooth_utils.dbus_to_python(dev['Address']))
        else:
            print("DEL path  : ", path)
        del devices[path]

def properties_changed(interface, changed, invalidated, path):
    if interface != bluetooth_constants.DEVICE_INTERFACE:
        return
    if path in devices:
        devices[path] = dict(devices[path].items())
        devices[path].update(changed.items())
    else:
        devices[path] = changed

def discovery_timeout():
    global adapter_interface
    global mainloop
    global timer_id
    GLib.source_remove(timer_id)
    mainloop.quit()
    adapter_interface.StopDiscovery()
    bus = dbus.SystemBus()
    bus.remove_signal_receiver(interfaces_added,"InterfacesAdded")
    bus.remove_signal_receiver(interfaces_removed,"InterfacesRemoved")
    bus.remove_signal_receiver(properties_changed,"PropertiesChanged")
    list_devices_found()
    return True

def discover_devices(bus, timeout):
    global adapter_interface
    global mainloop
    global timer_id
    adapter_path = bluetooth_constants.BLUEZ_NAMESPACE + bluetooth_constants.ADAPTER_NAME

    adapter_object = bus.get_object(bluetooth_constants.BLUEZ_SERVICE_NAME, adapter_path)
    adapter_interface=dbus.Interface(adapter_object, bluetooth_constants.ADAPTER_INTERFACE)

    bus.add_signal_receiver(interfaces_added,
            dbus_interface = bluetooth_constants.DBUS_OM_IFACE,
            signal_name = "InterfacesAdded")

    bus.add_signal_receiver(interfaces_removed,
            dbus_interface = bluetooth_constants.DBUS_OM_IFACE,
            signal_name = "InterfacesRemoved")

    bus.add_signal_receiver(properties_changed,
           dbus_interface = bluetooth_constants.DBUS_PROPERTIES,
            signal_name = "PropertiesChanged",
            path_keyword = "path")

    mainloop = GLib.MainLoop()
    timer_id = GLib.timeout_add(timeout, discovery_timeout)
    adapter_interface.StartDiscovery(byte_arrays=True)

    mainloop.run()

def get_known_devices(bus, adapter_path):
    global managed_objects_found
    global current_device_address
    object_manager = dbus.Interface(bus.get_object(bluetooth_constants.BLUEZ_SERVICE_NAME, "/"), bluetooth_constants.DBUS_OM_IFACE)
    managed_objects = object_manager.GetManagedObjects()

    # Iterate through the managed objects
    for path, ifaces in managed_objects.items():
        for iface_name in ifaces:
            # Check if the device is part of the current adapter
            if iface_name == bluetooth_constants.DEVICE_INTERFACE and path.startswith(adapter_path):
                managed_objects_found += 1
                print("EXI path  : ", path)
                device_properties = ifaces[bluetooth_constants.DEVICE_INTERFACE]
                devices[path] = device_properties
                if 'Name' in device_properties:
                    name = bluetooth_utils.dbus_to_python(device_properties['Name'])
                    print("Name: ", name)
                    if name == bluetooth_constants.DEVICE_NAME:
                        connect_to_device(bluetooth_utils.dbus_to_python(device_properties['Address']))

                if 'Address' in device_properties:
                    print("EXI bdaddr: ", bluetooth_utils.dbus_to_python(device_properties['Address']))

                print("------------------------------")

def on_connect(client, _, __, rc):
    print("Connected with return: ", rc)
    client.subscribe("host/ble")

def on_message(_, __, message):
    # print("<--", message.topic)
    topic = message.topic
    payload = message.payload.decode('utf-8')
    # print("Message: ", payload)
    print(f"<-- {message.topic}: {payload}")

    payload = json.loads(payload)

    if payload['mode'] == 'get_devices':
         for led in led_info:
             led_name = led["name"]
             uuid = bluetooth_utils.get_uuid_from_name(led["name"])
             path = bluetooth_utils.get_path_from_uuid(uuid, current_device_address)
             if path != 'Unknown':
                print(f"path for {led_name}: {path}")
                try:
                    status = read_characteristic_value(path)
                    print(f"Read characteristic value for {led_name} successful: {status}")
                    led["status"] = bool(status)
                except Exception as e:
                    print(f"Failed to read characteristic value for {led_name}")
                    reconnect_to_current_device()
                    status = read_characteristic_value(path)
                    print(f"Read characteristic value for {led_name} successful: {status}")

         message = {
             'mode':'get_devices_report',
             'leds': led_info
         }
         mqtt_publish('host/master', json.dumps(message))
         
    elif payload['mode'] == 'device_control':
        leds = payload['leds']  
        for led in leds:
            led_name = led['name']
            status = led['status']
            uuid = bluetooth_utils.get_uuid_from_name(led_name)
            # print(f"UUID for {led_name}: {uuid}")
            
            path = bluetooth_utils.get_path_from_uuid(uuid, current_device_address)
            if path != 'Unknown':
                # print(f"path for {led_name}: {path}")
                try:
                    write_characteristic_value(path, status)
                    print(f"Write characteristic value for {led_name} successful")
                except Exception as e:
                    print(f"Failed to write characteristic value for {led_name}")
                    reconnect_to_current_device()
                    write_characteristic_value(path, status)
            else:
                print(f"Invalid path for {led_name}")


def mqtt_publish(topic, message):
    client.publish(topic, message)
    print(f"--> {topic}: {message}")

def get_device_info(device_mac):
    bus = dbus.SystemBus()
    manager = dbus.Interface(bus.get_object(bluetooth_constants.BLUEZ_SERVICE_NAME, "/"), bluetooth_constants.DBUS_OM_IFACE)

    # Get all managed objects from BlueZ
    objects = manager.GetManagedObjects()

    # Filter the device we're interested in
    adapter_path = bluetooth_constants.BLUEZ_NAMESPACE + bluetooth_constants.ADAPTER_NAME
    device_path = bluetooth_utils.device_address_to_path(device_mac, adapter_path)
    
    if device_path not in objects:
        print(f"Device {device_mac} not found.")
        return

    # Iterate over all the objects to find services related to the specific device
    for path, interfaces in objects.items():
        if "org.bluez.Device1" not in interfaces.keys():
            continue
        
        # Check if this is the device we're looking for
        if path != device_path:
            continue
        
        # Now let's extract the services and characteristics for this device
        device = objects[path]
        properties = device["org.bluez.Device1"]

        # Print and store the basic device information
        for key in properties.keys():
            if key == "Name":
                print(f"Name: {properties[key]}")

        # Now, list the characteristics of each service for this device
        for service_path, service_interfaces in objects.items():
            if "org.bluez.GattService1" not in service_interfaces.keys():
                continue

            # Check if this service belongs to the same device
            if service_path.startswith(device_path):
                print("-------------------service--------------------")
                uuid = service_interfaces["org.bluez.GattService1"]['UUID']
                name = bluetooth_utils.get_name_from_uuid(service_interfaces["org.bluez.GattService1"]['UUID'])
                print(f"name: {name}")
                print(f"uuid: {uuid}")

                # Now list the characteristics for this service
                for char_path, char_interfaces in objects.items():
                    if "org.bluez.GattCharacteristic1" not in char_interfaces.keys():
                        continue

                    if char_path.startswith(service_path):
                        uuid = char_interfaces["org.bluez.GattCharacteristic1"]['UUID']
                        name = bluetooth_utils.get_name_from_uuid(char_interfaces["org.bluez.GattCharacteristic1"]['UUID'])
                        print(f"name: {name}")
                        print(f"uuid: {uuid}")

client = mqtt.Client(client_id="host ble")
client.on_connect = on_connect
client.on_message = on_message

client.connect(mqtt_server, 1883, 60)

def mqtt_loop():
    client.loop_start()

if __name__ == "__main__":
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    bus = dbus.SystemBus()
    adapter_path = bluetooth_constants.BLUEZ_NAMESPACE + bluetooth_constants.ADAPTER_NAME
    get_known_devices(bus, adapter_path)

    while current_device_address == '':
        discover_devices(bus, 5000)
        print(f"current device: {current_device_address}")

    print(current_device_address)
    get_device_info(current_device_address)

    mqtt_loop()  
    
    while True:
        pass  # Keep the program running, waiting for MQTT messages
