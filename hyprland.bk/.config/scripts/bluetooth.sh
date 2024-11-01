#!/bin/bash

# Funktion zum Scannen und Verbinden von Bluetooth-Geräten
function scan_and_connect {
    # Scan for available Bluetooth devices
    bluetoothctl scan on & sleep 5

    # List available Bluetooth devices and save the output
    devices=$(bluetoothctl devices)

    # Parse the devices to get names and MAC addresses separately
    device_names=$(echo "$devices" | awk '{print substr($0, index($0,$3))}')
    device_map=$(echo "$devices" | awk '{print substr($0, index($0,$3)) " " $2}')

    # Check if any devices were found
    if [ -z "$device_names" ]; then
        echo "No Bluetooth devices found" | rofi -dmenu -p "Bluetooth Devices" -config ~/.config/rofi/config-cliphist.rasi
        exit 1
    fi

    # Display the list of available devices in rofi and get the selected device name
    selected_device_name=$(echo "$device_names" | rofi -dmenu -p "Bluetooth Devices" -config ~/.config/rofi/config-cliphist.rasi)

    # Check if a selection was made
    if [ -n "$selected_device_name" ]; then
        # Get the MAC address of the selected device using the device map
        device_mac=$(echo "$device_map" | grep "$selected_device_name" | awk '{print $NF}')
        # Attempt to pair and connect to the selected device
        bluetoothctl pair "$device_mac"
        bluetoothctl connect "$device_mac"
    fi
}

# Funktion zum Trennen von verbundenen Bluetooth-Geräten
function disconnect_device {
    # List connected Bluetooth devices and save the output
    connected_devices=$(bluetoothctl devices Connected)

    # Check if any devices are connected
    if [ -z "$connected_devices" ]; then
        echo "No connected Bluetooth devices" | rofi -dmenu -p "Bluetooth Devices" -config ~/.config/rofi/config-cliphist.rasi
        exit 1
    fi

    # Parse the devices to get names and MAC addresses separately
    connected_device_names=$(echo "$connected_devices" | awk '{print substr($0, index($0,$3))}')
    connected_device_map=$(echo "$connected_devices" | awk '{print substr($0, index($0,$3)) " " $2}')

    # Display the list of connected devices in rofi and get the selected device name
    selected_connected_device_name=$(echo "$connected_device_names" | rofi -dmenu -p "Connected Bluetooth Devices" -config ~/.config/rofi/config-cliphist.rasi)

    # Check if a selection was made
    if [ -n "$selected_connected_device_name" ]; then
        # Get the MAC address of the selected device using the device map
        connected_device_mac=$(echo "$connected_device_map" | grep "$selected_connected_device_name" | awk '{print $NF}')
        # Disconnect the selected device
        bluetoothctl disconnect "$connected_device_mac"
    fi
}

# Hauptlogik
if [ "$1" == "-d" ]; then
    disconnect_device
else
    scan_and_connect
fi

