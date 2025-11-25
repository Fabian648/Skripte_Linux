#!/bin/bash

# Überprüfen, ob genau zwei Argumente übergeben wurden
if [[ $# -ne 2 ]]; then
    echo "ERROR: arguments are wrong. Usage: ./script.sh PREFIX DIRECTORY"
    exit 1
fi

PREFIX=$1
DIRECTORY=$2

# Überprüfen, ob das angegebene Verzeichnis existiert
if [[ ! -d "$DIRECTORY" ]]; then
    echo "ERROR: Directory does not exist: $DIRECTORY"
    exit 1
fi

# Debugging-Ausgabe
echo "Listing files in directory: $DIRECTORY"

# Alle Dateien im angegebenen Verzeichnis auflisten
for FILE in "$DIRECTORY"/*; do
    if [[ -e "$FILE" ]]; then
        BASENAME=$(basename "$FILE")
        NEWNAME="${DIRECTORY}/${PREFIX}${BASENAME}"

        # Überprüfen, ob die Zieldatei bereits existiert
        if [[ -e "$NEWNAME" ]]; then
            echo "ERROR: Datei $NEWNAME existiert bereits. Umbenennung abgebrochen."
        else
            echo "Datei $FILE wird umbenannt nach $NEWNAME"
            mv "$FILE" "$NEWNAME"
            echo "Umbenannt: $FILE nach $NEWNAME"
        fi
    fi
done

