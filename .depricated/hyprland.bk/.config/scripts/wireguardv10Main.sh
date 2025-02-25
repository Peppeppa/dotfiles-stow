#!/bin/bash

# Funktion zur Anzeige der Hilfe
show_help() {
    echo "Verwendung: $(basename $0) [-u] [-d] [-r]"
    echo "Optionen:"
    echo "  -u    Startet das WireGuard Interface v10Main"
    echo "  -d    Stoppt das WireGuard Interface v10Main"
    echo "  -r    Startet das WireGuard Interface neu (stoppt und startet es)"
}

# Überprüfe, ob keine Argumente übergeben wurden
if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

# Initialisiere Variablen für die Flags
UP_FLAG=false
DOWN_FLAG=false
RESTART_FLAG=false

# Parse die übergebenen Flags
while getopts ":udr" opt; do
    case $opt in
        u)
            UP_FLAG=true
            ;;
        d)
            DOWN_FLAG=true
            ;;
        r)
            RESTART_FLAG=true
            ;;
        \?)
            echo "Ungültige Option: -$OPTARG" >&2
            show_help
            exit 1
            ;;
    esac
done

# Führe die entsprechenden Aktionen basierend auf den gesetzten Flags aus
if $UP_FLAG; then
    wg-quick up v10Main
fi

if $DOWN_FLAG; then
    wg-quick down v10Main
fi

if $RESTART_FLAG; then
    wg-quick down v10Main
    sleep 2  # Warte 2 Sekunden
    wg-quick up v10Main
fi

exit 0
