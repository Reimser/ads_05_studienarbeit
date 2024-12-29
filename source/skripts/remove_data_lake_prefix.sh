#!/bin/bash

# Verzeichnis mit den CSV-Dateien
CSV_DIR="/mnt/c/Users/hp/OneDrive/Desktop/DBU/ads_05/ads_05_studienarbeit/input/data-lake"

# Prüfen, ob das Verzeichnis existiert
if [ ! -d "$CSV_DIR" ]; then
  echo "Verzeichnis $CSV_DIR existiert nicht. Abbruch."
  exit 1
fi

# Schleife über alle CSV-Dateien im Verzeichnis
for csv_file in "$CSV_DIR"/*.csv; do
  if [ -f "$csv_file" ]; then
    echo "Verarbeite Datei: $csv_file"

    # Ersetzen von "data-lake/" in der Datei
    sed -i 's|data-lake/||g' "$csv_file"

    echo "Daten bereinigt: $csv_file"
  else
    echo "Keine CSV-Dateien gefunden im Verzeichnis $CSV_DIR."
  fi
done

echo "Bereinigung abgeschlossen."
