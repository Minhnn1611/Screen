from gi.repository import GLib
import paho.mqtt.client as mqtt
import bluetooth_utils
import bluetooth_constants
import dbus
import dbus.mainloop.glib
import json
import sys

sys.path.insert(0, '.')

adapter_interface = None
mainloop = None
timer_id = None

devices = {}
managed_objects_found = 0
current_device_address = ''

led_path = "/org/bluez/hci1/dev_34_25_B4_A0_B6_C2/service0019/char001a"  # Example LED path

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
    bus = dbus.SystemBus()
    char = bus.get_object("org.bluez", characteristic_path)
    char_interface = dbus.Interface(char, "org.bluez.GattCharacteristic1")
    byte_values = [dbus.Byte(value_to_write)]
    char_interface.WriteValue(dbus.Array(byte_values, signature=dbus.Signature('y')), {})
    print(f"Wrote value: {value_to_write}")

def list_devices_found():
    print("Full list of devices", len(devices), "discovered:")
    print("------------------------------")
    for path in devices:
        dev = devices[path]
        if 'Address' in dev:
            print("Device Address:", bluetooth_utils.dbus_to_python(dev['Address']))
            device_address = bluetooth_utils.dbus_to_python(dev['Address'])
        if 'Name' in dev:
            print("Device Name  :", bluetooth_utils.dbus_to_python(dev['Name']))
            message = {
                'mode': 'scan_report',
                'device_name': bluetooth_utils.dbus_to_python(dev['Name']),
                'device_addr': device_address,
            }
            mqtt_publish("web/ble", json.dumps(message))
        if 'Connected' in dev:
            print('Connected:', bluetooth_utils.dbus_to_python(dev['Connected']))
        print("------------------------------")

def connect_to_device(device_address):
    global current_device_address
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
        # message = {
        #     'mode':"connected_report",
        #     "status":True
        # }
        # mqtt_publish("web/ble", json.dumps(message))
        message = bluetooth_utils.get_device_info(current_device_address)
        message["mode"] = "connected_report"
        message["status"] = True
        mqtt_publish("web/ble", json.dumps(message))

    except Exception as e:
        print(f"Failed to connect to device {device_address}")
        message = {
            'mode':'connected_report',
            'status':False
        }
        mqtt_publish('web/ble', json.dumps(message))
        print(e.get_dbus_name())
        print(e.get_dbus_message())
        if "UnknownObject" in e.get_dbus_name():
            print("Try scanning first to resolve this problem")

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
        if 'RSSI' in dev:
            print("NEW RSSI  : ", bluetooth_utils.dbus_to_python(dev['RSSI']))

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
                if 'Address' in device_properties:
                    print("EXI bdaddr: ", bluetooth_utils.dbus_to_python(device_properties['Address']))
                if 'Connected' in device_properties:
                    connected = bluetooth_utils.dbus_to_python(device_properties['Connected'])
                    print("EXI cncted: ", connected)
                    if connected == 1:
                        current_device_address = bluetooth_utils.dbus_to_python(device_properties['Address'])
                        print(f"current device: {current_device_address}")
                print("------------------------------")


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


def on_connect(client, _, __, rc):
    print("Connected with return: ", rc)
    client.subscribe("host/ble")

def on_message(_, __, message):
    print("<===", message.topic)
    topic = message.topic
    payload = message.payload.decode('utf-8')
    print("Message: ", payload)

    payload = json.loads(payload)

    if payload['mode'] == 'scan':
        discover_devices(bus, 3000)
    elif payload['mode'] == 'connect':
        connect_to_device(payload['device_address'])
    elif payload['mode'] == 'led_control':
        led_uuid = payload['led_uuid']
        led_status = payload['led_status']
        path = bluetooth_utils.get_path_from_uuid(led_uuid, current_device_address)
        if path != 'Unknown':
            print(f"path: {path}")
            write_characteristic_value(path, led_status)
        else:
            print("invalid path")


def mqtt_publish(topic, message):
    # data = message.SerializeToString()
    client.publish(topic, message)
    print("--> ", topic," : ",message)

client = mqtt.Client(client_id="host ble")
client.on_connect = on_connect
client.on_message = on_message

client.connect("127.0.0.1", 1883, 60)

def mqtt_loop():
    client.loop_start()

if __name__ == "__main__":
    dbus.mainloop.glib.DBusGMainLoop(set_as_default=True)
    bus = dbus.SystemBus()

    print("Listing devices already known to BlueZ:")
    adapter_path = bluetooth_constants.BLUEZ_NAMESPACE + bluetooth_constants.ADAPTER_NAME
    get_known_devices(bus, adapter_path)
    print("Found ", managed_objects_found, " managed device objects")

    mqtt_loop()  # Start MQTT client loop to keep it running

    while True:
        pass  # Keep the program running, waiting for MQTT messages
