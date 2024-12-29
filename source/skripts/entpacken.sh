#!/bin/bash

# Pfad zum data-lake Ordner
DATADIR="/mnt/c/Users/hp/OneDrive/Desktop/data-lake"

echo "Entpacke alle .tar.gz Dateien in $DATADIR..."

# Iteriere über alle .tar.gz Dateien
for tarfile in "$DATADIR"/*.tar.gz; do
    [ -e "$tarfile" ] || continue  # Überspringen, wenn keine .tar.gz Dateien vorhanden

    echo "Verarbeite $tarfile..."

    # Extrahiere den Basisnamen ohne .tar.gz
    basename=$(basename "$tarfile" .tar.gz)

    # Erstelle einen Zielordner
    mkdir -p "$DATADIR/$basename"

    # Entpacke die .tar.gz Datei
    tar -xzf "$tarfile" -C "$DATADIR/$basename"

    # Überprüfe, ob das Entpacken erfolgreich war
    if [ $? -eq 0 ]; then
        echo "Erfolgreich entpackt: $tarfile"
        # Lösche die .tar.gz Datei
        rm "$tarfile"
        echo "Archiv gelöscht: $tarfile"
    else
        echo "Fehler beim Entpacken: $tarfile"
    fi
done

echo "Entpacken abgeschlossen."
