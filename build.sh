#!/bin/bash

# Stellt sicher, dass das Skript bei Fehlern sofort abbricht
set -e

echo "--- Aktualisiere pip und setuptools ---"
pip install --upgrade pip setuptools

echo "--- Installiere uv ---"
pip install uv

echo "--- Installiere Python-Abhängigkeiten mit uv ---"
# uv pip install ist der moderne Weg, wir nutzen hier --system um es in der globalen Render Umgebung zu installieren
# uv ist sehr schnell und umgeht oft pip-Build-Probleme
uv pip install -r requirements.txt --system

echo "--- Build-Prozess abgeschlossen ---"
