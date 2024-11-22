#!/usr/bin/python3
import dbus
import sys
import json
from sys import stdin, stdout
sys.path.insert(0, '.')
import bluetooth_constants

def byteArrayToHexString(bytes):
    hex_string = ""
    for byte in bytes:
        hex_byte = '%02X' % byte
        hex_string = hex_string + hex_byte
    return hex_string

def dbus_to_python(data):
    if isinstance(data, dbus.String):
        data = str(data)
    if isinstance(data, dbus.ObjectPath):
        data = str(data)
    elif isinstance(data, dbus.Boolean):
        data = bool(data)
    elif isinstance(data, dbus.Int64):
        data = int(data)
    elif isinstance(data, dbus.Int32):
        data = int(data)
    elif isinstance(data, dbus.Int16):
        data = int(data)
    elif isinstance(data, dbus.UInt16):
        data = int(data)
    elif isinstance(data, dbus.Byte):
        data = int(data)
    elif isinstance(data, dbus.Double):
        data = float(data)
    elif isinstance(data, dbus.Array):
        data = [dbus_to_python(value) for value in data]
    elif isinstance(data, dbus.Dictionary):
        new_data = dict()
        for key in data.keys():
            new_data[key] = dbus_to_python(data[key])
        data = new_data
    return data

def device_address_to_path(bdaddr, adapter_path):
    # e.g.convert 12:34:44:00:66:D5 on adapter hci0 to /org/bluez/hci0/dev_12_34_44_00_66_D5
    path = adapter_path + "/dev_" + bdaddr.replace(":","_")
    return path

def get_name_from_uuid(uuid):
    if uuid in bluetooth_constants.UUID_NAMES:
        return bluetooth_constants.UUID_NAMES[uuid]
    else:
        return "Unknown"

def get_uuid_from_name(name):
    for uuid in bluetooth_constants.UUID_NAMES:
        if bluetooth_constants.UUID_NAMES[uuid] == name:
            return uuid

def get_path_from_uuid(uuid, device_address):
    bus = dbus.SystemBus()
    adapter_path = bluetooth_constants.BLUEZ_NAMESPACE + bluetooth_constants.ADAPTER_NAME
    device_path = device_address_to_path(device_address, adapter_path)
    object_manager = dbus.Interface(bus.get_object(bluetooth_constants.BLUEZ_SERVICE_NAME, "/"), bluetooth_constants.DBUS_OM_IFACE)
    managed_objects = object_manager.GetManagedObjects()

    if device_path not in managed_objects:
        print(f"device {device_address} not found")
        return "Unknown"
    
    for char_path, char_ifaces in managed_objects.items():
        if bluetooth_constants.GATT_CHARACTERISTIC_INTERFACE not in char_ifaces.keys():
            continue
        if char_path.startswith(device_path):
            char = char_ifaces[bluetooth_constants.GATT_CHARACTERISTIC_INTERFACE]
            if 'UUID' in char:
                if char['UUID'] == uuid:
                    return char_path

    return "Unknown"

def get_device_info(device_mac):
    bus = dbus.SystemBus()
    manager = dbus.Interface(bus.get_object(bluetooth_constants.BLUEZ_SERVICE_NAME, "/"), bluetooth_constants.DBUS_OM_IFACE)

    # Get all managed objects from BlueZ
    objects = manager.GetManagedObjects()

    # Filter the device we're interested in
    adapter_path = bluetooth_constants.BLUEZ_NAMESPACE + bluetooth_constants.ADAPTER_NAME
    device_path = device_address_to_path(device_mac, adapter_path)
    
    if device_path not in objects:
        print(f"Device {device_mac} not found.")
        return

    # Create a dictionary to store the service and characteristic information
    device_info = {
        "device_mac": device_mac,
        "device_name":"",
        "services": []
    }

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
                device_info["device_name"] = properties[key]

        # Now, list the characteristics of each service for this device
        for service_path, service_interfaces in objects.items():
            if "org.bluez.GattService1" not in service_interfaces.keys():
                continue

            # Check if this service belongs to the same device
            if service_path.startswith(device_path):
                service_info = {
                    "UUID": service_interfaces["org.bluez.GattService1"]['UUID'],
                    "name": get_name_from_uuid(service_interfaces["org.bluez.GattService1"]['UUID']),
                    "characteristics": []
                }

                # Now list the characteristics for this service
                for char_path, char_interfaces in objects.items():
                    if "org.bluez.GattCharacteristic1" not in char_interfaces.keys():
                        continue

                    if char_path.startswith(service_path):
                        char_info = {
                            "UUID": char_interfaces["org.bluez.GattCharacteristic1"]['UUID'],
                            "name": get_name_from_uuid(char_interfaces["org.bluez.GattCharacteristic1"]['UUID']),
                            "Flags": char_interfaces["org.bluez.GattCharacteristic1"]['Flags']
                        }

                        service_info["characteristics"].append(char_info)

                # Add the service to the device's services list
                device_info["services"].append(service_info)

    return device_info

def text_to_ascii_array(text):
    ascii_values = []
    for character in text:
        ascii_values.append(ord(character))
    return ascii_values

def print_properties(props):
    # dbus.Dictionary({dbus.String('SupportedInstances'): dbus.Byte(4, variant_level=1), dbus.String('ActiveInstances'): dbus.Byte(1, variant_level=1)}, signature=dbus.Signature('sv'))
    for key in props:
        print(key+"="+str(props[key]))