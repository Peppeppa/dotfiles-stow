#!/bin/bash

# Simple Wallpaper Setter mit swww

# --- Konfiguration ---
WALLPAPER_DIR="$HOME/git/medvidec/wallpaper"
cache_file="$HOME/.cache/current_wallpaper"
rasi_file="$HOME/.cache/current_wallpaper.rasi"
default_wallpaper="$WALLPAPER_DIR/default.jpg"

# --- Cache vorbereiten ---
[ ! -f "$cache_file" ] && echo "$default_wallpaper" > "$cache_file"

current_wallpaper=$(cat "$cache_file")

# --- Wallpaper-Auswahl ---
case "$1" in
    "select")
        selected=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) -exec basename {} \; | sort -R | while read -r rfile
        do
            echo -en "$rfile\x00icon\x1f$WALLPAPER_DIR/$rfile\n"
        done | rofi -dmenu -i -replace -config ~/.config/rofi/config-wallpaper.rasi)

        [ -z "$selected" ] && echo "❌ Kein Wallpaper gewählt." && exit 1

        wallpaper="$WALLPAPER_DIR/$selected"
        ;;
    "init")
        wallpaper="$current_wallpaper"
        ;;
    *)
        wallpaper=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)
        ;;
esac

# --- Prüfung ---
if [ ! -f "$wallpaper" ]; then
    echo "Datei nicht gefunden: $wallpaper"
    exit 1
fi

echo "Setze Wallpaper: $wallpaper"

# --- Wallpaper setzen ---
swww img "$wallpaper" \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type="wipe" \
    --transition-duration=0.7 \
    --transition-pos "$(hyprctl cursorpos)"

# --- Cache aktualisieren ---
echo "$wallpaper" > "$cache_file"
echo "* { current-image: url(\"$wallpaper\", height); }" > "$rasi_file"

# --- Notification ---
[ "$1" != "init" ] && notify-send "Wallpaper geändert" "$(basename "$wallpaper")"

