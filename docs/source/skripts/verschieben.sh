#!/bin/bash
#Dieses Bash-Skript automatisiert die Organisation und Verschiebung von HTML- und CSV-Dateien aus einem definierten
#data-lake-Ordner in spezifische Zielverzeichnisse innerhalb eines Projekts. Es wurde entwickelt, um nach der 
#Datenextraktion und Entpackung bestimmte HTML- und CSV-Dateien zu filtern und in eine geordnete Struktur zu überführen.
# Definiere die Pfade zu den Zielordnern
zielordner_html="/mnt/c/Users/hp/OneDrive/Desktop/DBU/ads-05/ads_o5_studienarbeit/input/data_lake"
zielordner_csv="/mnt/c/Users/hp/OneDrive/Desktop/DBU/ads-05/ads_o5_studienarbeit/input/data_lake"

# Erstelle die Zielordner, falls sie nicht existieren
mkdir -p "$zielordner_html"
mkdir -p "$zielordner_csv"

# Definiere den Pfad zum Datenordner
datenordner="/mnt/c/Users/hp/OneDrive/Desktop/data-lake"

# Liste der zu behaltenden HTML-Dateinamen (Muster)
behalten=("sz" "zeit" "faz" "heise" "golem" "tagesspiegel" "taz" "abendblatt" "berliner" "welt" "esslinger" "ntv" "pioneer" "suedwest" "uebermedien" "dlf" "spiegel" "stern" "tagesschau" "wiwo")

# Finde alle 'data-lake' Ordner nach der Entpackung
echo "Suche nach 'data-lake' Ordnern..."

find "$datenordner" -type d -name "data-lake" | while read -r entpackter_ordner; do
    echo "Verarbeite Ordner: $entpackter_ordner"

    # Verschiebe ausgewählte HTML-Dateien
    for datei in "$entpackter_ordner"/*.html; do
        if [ -e "$datei" ]; then
            basisname=$(basename "$datei" .html)
            for k in "${behalten[@]}"; do
                if [[ "$basisname" == *"$k"* ]]; then
                    echo "Verschiebe HTML: $datei"
                    mv "$datei" "$zielordner_html"
                    break
                fi
            done
        else
            echo "Keine HTML-Dateien gefunden in $entpackter_ordner."
        fi
    done

    # Verschiebe alle CSV-Dateien
    for datei in "$entpackter_ordner"/*.csv; do
        if [ -e "$datei" ]; then
            echo "Verschiebe CSV: $datei"
            mv "$datei" "$zielordner_csv"
        else
            echo "Keine CSV-Dateien gefunden in $entpackter_ordner."
        fi
    done
done

echo "Vorgang abgeschlossen."
