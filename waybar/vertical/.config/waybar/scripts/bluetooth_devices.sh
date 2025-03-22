#!/bin/bash

TEXT=""

#KEYBOARD_MAC="5C:MAC"
#MOUSE_MAC="5C:MAC"
#SPEAKER_MAC="5C:MAC"
EARBUDS_MAC="$M_HEADSET"

#keyboard_status=$(bluetoothctl info ${KEYBOARD_MAC} | grep Connected | cut -d ' ' -f 2)
#mouse_status=$(bluetoothctl info ${MOUSE_MAC} | grep Connected | cut -d ' ' -f 2)
#speaker_status=$(bluetoothctl info ${SPEAKER_MAC} | grep Connected | cut -d ' ' -f 2)
earbuds_status=$(bluetoothctl info ${EARBUDS_MAC} | grep Connected | cut -d ' ' -f 2)

#if [ "$keyboard_status" = "yes" ]; then
#  TEXT=$TEXT""
#fi

#if [ "$mouse_status" = "yes" ]; then
#  TEXT=$TEXT""
#fi

#if [ "$speaker_status" = "yes" ]; then
#  TEXT=$TEXT""
#fi

if [ "$earbuds_status" = "yes" ]; then
  TEXT=$TEXT"󱡒"
fi

echo "{\"text\": \"${TEXT}\", \"class\": \"bluetooth_devices\", \"tooltip\": \"\"}"
