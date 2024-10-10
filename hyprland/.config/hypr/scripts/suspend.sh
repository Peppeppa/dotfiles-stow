#!/bin/bash
swayidle -w \
timeout 6000 ' hyprlock ' \
#timeout 400 ' hyprctl dispatch dpms off' \
#timeout 12000 'systemctl suspend' \
#resume ' hyprctl dispatch dpms on' \
#before-sleep 'hyprlock'
