#!/bin/bash
set -e

echo "--- Aktualisiere pip, setuptools und wheel ---"
pip install --upgrade pip setuptools wheel

echo "--- Installiere uv ---"
pip install uv

echo "--- Installiere Python-Abhängigkeiten mit uv ---"
uv pip install -r requirements.txt --system

echo "--- Build-Prozess abgeschlossen ---"
