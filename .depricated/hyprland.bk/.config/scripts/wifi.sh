#!/bin/bash

# Funktion zum Scannen und Verbinden mit WLAN-Netzwerken
function scan_and_connect {
    # Scan for available Wi-Fi networks
    nmcli dev wifi rescan
    sleep 5

    # List available Wi-Fi networks and save the output
    networks=$(nmcli -t -f SSID,SECURITY dev wifi list)

    # Parse the networks to get SSIDs and security types separately
    network_names=$(echo "$networks" | awk -F':' '{print $1}')
    network_map=$(echo "$networks" | awk -F':' '{print $1 " " $2}')

    # Check if any networks were found
    if [ -z "$network_names" ]; then
        echo "No Wi-Fi networks found" | rofi -dmenu -p "Wi-Fi Networks" -config ~/.config/rofi/config-wifi.rasi
        exit 1
    fi

    # Display the list of available networks in rofi and get the selected network name
    selected_network_name=$(echo "$network_names" | rofi -dmenu -p "Wi-Fi Networks" -config ~/.config/rofi/config-wifi.rasi)

    # Check if a selection was made
    if [ -n "$selected_network_name" ]; then
        # Get the security type of the selected network using the network map
        security_type=$(echo "$network_map" | grep "^$selected_network_name " | awk '{print $NF}')

        # Check if the network is secured
        if [ "$security_type" != "--" ]; then
            # Prompt for the Wi-Fi password
            wifi_password=$(echo "" | rofi -dmenu -p "Password for $selected_network_name" -password -config ~/.config/rofi/config-wifi.rasi)
        fi

        # Attempt to connect to the selected network
        if [ -n "$wifi_password" ]; then
            nmcli dev wifi connect "$selected_network_name" password "$wifi_password"
        else
            nmcli dev wifi connect "$selected_network_name"
        fi
    fi
}

# Hauptlogik
scan_and_connect

