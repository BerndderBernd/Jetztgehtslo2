#!/bin/bash

# Stellt sicher, dass das Skript bei Fehlern sofort abbricht
set -e

echo "--- Aktualisiere pip und setuptools ---"
python -m pip install --upgrade pip setuptools

echo "--- Installiere Python-Abhängigkeiten (inkl. gunicorn) mit pip ---"
python -m pip install -r requirements.txt --no-cache-dir --upgrade-strategy eager

echo "--- Build-Prozess abgeschlossen ---"
