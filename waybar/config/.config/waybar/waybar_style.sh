#!/bin/bash

cd ~/git/dotfiles-stow/waybar || exit 1

figlet "waybar - style"

directories=(*)

selected=$(printf "%s\n" "${directories[@]}" | fzf --height=10 --border --prompt="Select a style: ")

if [ -z "$selected" ]; then
    echo "Keine Auswahl getroffen."
    exit 1
fi

if [ -d ~/.config/waybar ]; then
    echo "~/.config/waybar existiert bereits. Lösche..."
    rm -rf ~/.config/waybar
fi

stow -t ~ config "$selected"

echo "Waybar-Stil $selected erfolgreich angewendet."

