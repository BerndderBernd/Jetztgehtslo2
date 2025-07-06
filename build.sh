#!/bin/bash

# Stellt sicher, dass das Skript bei Fehlern sofort abbricht
set -e

echo "--- Aktualisiere pip und setuptools ---"
python -m pip install --upgrade pip setuptools

echo "--- Installiere Python-Abhängigkeiten mit pip ---"
# Verwenden von --no-cache-dir, um zu vermeiden, dass alte Caches Probleme verursachen könnten
# --upgrade-strategy eager stellt sicher, dass alle Abhängigkeiten auf die neueste Version aktualisiert werden
python -m pip install -r requirements.txt --no-cache-dir --upgrade-strategy eager

echo "--- Build-Prozess abgeschlossen ---"
