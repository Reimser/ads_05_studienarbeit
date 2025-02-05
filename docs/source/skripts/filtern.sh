#!/bin/bash
#Dieses Bash-Skript wurde entwickelt, um HTML- und CSV-Dateien aus einem Data-Lake-Ordner automatisch zu organisieren
#und anschließend den ursprünglichen Data-Lake-Ordner zu bereinigen.
# Pfad zum Hauptordner data-lake
DATADIR="/mnt/c/Users/hp/OneDrive/Desktop/data-lake"

# Zielordner für HTML- und CSV-Dateien
ZIEL_HTML="/mnt/c/Users/hp/OneDrive/Desktop/DBU/ads-05/ads_05_studienarbeit/input/data_lake"
ZIEL_CSV="/mnt/c/Users/hp/OneDrive/Desktop/DBU/ads-05/ads_05_studienarbeit/input/data_lake"

# Erstelle die Zielordner, falls sie nicht existieren
mkdir -p "$ZIEL_HTML"
mkdir -p "$ZIEL_CSV"

# Liste der zu behaltenden HTML-Dateinamen (Muster)
BEHALTEN=("sz" "zeit" "faz" "heise" "golem" "tagesspiegel" "taz" "abendblatt" "berliner" "welt" "esslinger" "ntv" "pioneer" "suedwest" "uebermedien" "dlf" "spiegel" "stern" "tagesschau" "wiwo")

echo "Starte das Verschieben der Dateien..."

# Durchlaufe alle Unterordner im Hauptordner
for monat_ordner in "$DATADIR"/*/; do
    # Überprüfe, ob es sich um ein Verzeichnis handelt
    if [ -d "$monat_ordner" ]; then
        echo "Verarbeite Ordner: $monat_ordner"
        
        # Pfad zum data-lake-Ordner innerhalb des Monatsordners
        data_lake_ordner="${monat_ordner}data-lake"
        
        # Überprüfe, ob der data-lake-Ordner existiert
        if [ -d "$data_lake_ordner" ]; then
            # Verschiebe passende HTML-Dateien
            for html_datei in "$data_lake_ordner"/*.html; do
                if [ -f "$html_datei" ]; then
                    basename=$(basename "$html_datei" .html)
                    for muster in "${BEHALTEN[@]}"; do
                        if [[ "$basename" == *"$muster"* ]]; then
                            echo "Verschiebe HTML: $html_datei nach $ZIEL_HTML"
                            mv "$html_datei" "$ZIEL_HTML"
                            break
                        fi
                    done
                fi
            done
            
            # Verschiebe alle CSV-Dateien
            for csv_datei in "$data_lake_ordner"/*.csv; do
                if [ -f "$csv_datei" ]; then
                    echo "Verschiebe CSV: $csv_datei nach $ZIEL_CSV"
                    mv "$csv_datei" "$ZIEL_CSV"
                fi
            done
            
            # Lösche den leeren data-lake-Ordner
            echo "Lösche Ordner: $data_lake_ordner"
            rm -rf "$data_lake_ordner"
        else
            echo "data-lake- Ordner in $monat_ordner nicht gefunden."
        fi
    fi
done

echo "Verschieben abgeschlossen."
