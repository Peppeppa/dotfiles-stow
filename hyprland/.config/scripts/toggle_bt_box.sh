#!/bin/bash

#!/bin/bash

# MAC-Adresse deiner Bluetooth-Box
MAC="04:21:44:72:B1:08"

# Prüfen, ob verbunden
if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
    bluetoothctl disconnect "$MAC"
else
    bluetoothctl connect "$MAC"
fi
