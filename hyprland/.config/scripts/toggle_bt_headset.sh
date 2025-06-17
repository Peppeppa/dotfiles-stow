#!/bin/bash

#!/bin/bash

# MAC-Adresse deiner Bluetooth-Box
MAC="68:59:32:0B:6B:59"

# Prüfen, ob verbunden
if bluetoothctl info "$MAC" | grep -q "Connected: yes"; then
    bluetoothctl disconnect "$MAC"
else
    bluetoothctl connect "$MAC"
fi
