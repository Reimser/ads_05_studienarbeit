
## Replikationsstudie ADS-05

**Projektübersicht**
-----------------------
Dieses Projekt ist eine **Replikationsstudie** im Rahmen des Moduls **Applied Data Science 5 (ADS-05): Visualisierung und Kommunikation** an der **Digital Business University of Applied Sciences**.  
Ziel ist es, eine bestehende Analyse zur Entwicklung politischer Diskurse und Wahltrends in Deutschland nachzustellen, methodisch zu erweitern und durch optimierte Visualisierungen aufzubereiten.

Die Hauptfragestellung lautet:  
**Wie unterscheiden sich mediale Berichterstattung und politische Diskurse im Jahr 2024 von den Vorjahren (2021-2023)? Welche politischen Ereignisse haben diese Entwicklungen geprägt?**

**Inhalte der Studie**
-------------------------
Die Analyse basiert auf zwei primären Datenquellen:
1. **Politbarometer-Daten** der Forschungsgruppe Wahlen e.V. (Stimmungsumfragen zu Parteien).
2. **Wordcount-Daten aus Nachrichtenportalen**, die mittels Web-Scraping gesammelt wurden.

Die Daten wurden bereinigt, aggregiert und visuell aufbereitet, um **Zusammenhänge zwischen Medienpräsenz und Wahltrends** herauszuarbeiten.  
Wichtige Ereignisse wie die **Europawahl 2024** und der **Bruch der Ampel-Koalition** wurden dabei besonders berücksichtigt.

**Projektstruktur**
---------------------
Das Projekt ist in mehrere Hauptkomponenten unterteilt:

- **Projektbeschreibung:** Überblick über die Replikationsstudie.
- **Präsentation & Screencast:** Visuelle Aufbereitung der Ergebnisse.
- **Datenbasierter Report:** Wissenschaftlicher Bericht mit detaillierten Analysen.
- **Notebooks:**
  - **DWH:** Verarbeitung und Speicherung der gescrapten Daten.
  - **Transform:** Transformation der Rohdaten.
  - **EDA:** Explorative Datenanalyse.
  - **Visualize:** Erstellung interaktiver Visualisierungen.
- **Skripte:**
  - **Entpacken-Skript**
  - **Verschieben-Skript**
  - **Filtern-Skript**
- **Quellenverzeichnis:** Verweise auf Datenquellen und wissenschaftliche Arbeiten.

**Installation & Nutzung**
----------------------------
**Voraussetzungen:**  
- Python 3.8 oder höher  
- Abhängigkeiten (siehe `requirements.txt`)  
- Jupyter Notebook oder eine Entwicklungsumgebung wie VS Code

**Installation:**  
```bash
pip install -r requirements.txt
