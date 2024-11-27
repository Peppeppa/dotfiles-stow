
#!/bin/bash

# Cache file for holding the current wallpaper
cache_file="$HOME/.cache/current_wallpaper"
wallpaper_dir="$HOME/git/wallpaper"
blurred="$HOME/.cache/blurred_wallpaper.png"
rasi_file="$HOME/.cache/current_wallpaper.rasi"
blur_file="$HOME/.config/.settings/blur.sh"

# Create cache file if not exists
if [ ! -f "$cache_file" ]; then
    mkdir -p "$(dirname "$cache_file")"
    touch "$cache_file"
    echo "$HOME/git/wallpaper/default.jpg" > "$cache_file"
fi

# Function: Load wallpaper on system start
function init() {
    current_wallpaper=$(cat "$cache_file")
    if [ -f "$current_wallpaper" ]; then
        hyprctl hyprpaper unload all
        hyprctl hyprpaper preload "$current_wallpaper"
    else
        echo "Wallpaper not found, using default."
        echo "$HOME/git/wallpaper/default.jpg" > "$cache_file"
        hyprctl hyprpaper preload "$HOME/git/wallpaper/default.jpg"
    fi
}

# Function: Select and set wallpaper
function select1() {
    # Find and select a file using fzf with preview in kitty
    selected_file=$(find "$wallpaper_dir" -type f | \
        fzf --preview="kitty +kitten icat {}" --preview-window=up:50% --height=100% --layout=reverse --border --ansi \
        --prompt="🔎 Select wallpaper: " --header="Press ENTER to select wallpaper")

    if [ -n "$selected_file" ]; then
        echo "$selected_file" > "$cache_file"
        hyprctl hyprpaper unload all
        hyprctl hyprpaper preload "$selected_file"
        echo "Wallpaper geändert zu: $selected_file"
    else
        echo "Keine Datei ausgewählt. Abbruch."
    fi
}

# Main script logic
case "$1" in
    init)
        init
        ;;
    select1)
        select1
        ;;
    *)
        echo "Nutzung: $0 {init|select}"
        exit 1
        ;;
esac
