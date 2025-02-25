#!/bin/bash


# Überprüfen, ob das -h Flag verwendet wird
if [ "$1" == "-h" ]; then
    echo "NAME"
    echo "    gf - Git Flow mit Stow"
    echo ""
    echo "SYNOPSIS"
    echo "    gf [<commitmessage>] [-s] [-h]"
    echo ""
    echo "BESCHREIBUNG"
    echo "    Führt Git-Operationen aus und führt optional den Befehl stow aus."
    echo "    Es werden folgende Befehle in dieser Reihenfolge ausgeführt:"
    echo "    	git add ."
    echo " 	git commit -m <commitmessage>"
    echo " 	git push"
    echo ""
    echo "OPTIONEN"
    echo "    -h     Zeigt diese Hilfe an"
    echo "    -s     Führt zusätzlich den Befehl stow aus"
    echo ""
    exit 0
fi

# Initialisierung der Variablen
commit_message=""
stow_flag=0

# Argumente überprüfen und verarbeiten
for arg in "$@"; do
    case $arg in
        -s)
            stow_flag=1
            ;;
        *)
            if [ -z "$commit_message" ]; then
                commit_message="$arg"
            else
                commit_message="$commit_message $arg"
            fi
            ;;
    esac
done

# Überprüfen, ob eine Commit-Nachricht angegeben wurde
if [ -z "$commit_message" ]; then
    echo "Bitte geben Sie eine Commit-Nachricht an."
    exit 1
fi

# Füge alle Änderungen hinzu
git add .

# Commit mit der übergebenen Nachricht durchführen
git commit -m "$commit_message"

# Pushen
git push

# Wenn das Flag -s gesetzt ist, führe stow aus
if [ $stow_flag -eq 1 ]; then
    stow -d ~/git/dotfiles/ . -t ~/
fi



