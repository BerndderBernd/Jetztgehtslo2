#!/bin/bash

# Stellt sicher, dass das Skript bei Fehlern sofort abbricht
set -e

echo "--- Aktualisiere pip und setuptools ---"
python -m pip install --upgrade pip setuptools

echo "--- Installiere Python-Abhängigkeiten (inkl. gunicorn) mit pip ---"
# Verwenden von --no-cache-dir, um zu vermeiden, dass alte Caches Probleme verursachen könnten
# --upgrade-strategy eager stellt sicher, dass alle Abhängigkeiten auf die neueste Version aktualisiert werden
python -m pip install -r requirements.txt --no-cache-dir --upgrade-strategy eager

# NEU: Überprüfe, wo gunicorn installiert wurde und verlinke es in /usr/local/bin
echo "--- Suche Gunicorn und erstelle Symlink ---"
# Suche nach dem gunicorn-Executable innerhalb des Python-Site-Packages-Verzeichnisses
GUNICORN_PATH=$(find /opt/render/project/src/.venv/ -name "gunicorn" -type f -perm /u+x | grep -E "bin/gunicorn$")

if [ -z "$GUNICORN_PATH" ]; then
  echo "Fehler: gunicorn-Executable wurde nicht gefunden!"
  exit 1
else
  echo "Gunicorn gefunden unter: $GUNICORN_PATH"
  # Erstelle einen symbolischen Link in /usr/local/bin, das im PATH enthalten sein sollte
  sudo ln -sf "$GUNICORN_PATH" /usr/local/bin/gunicorn
  echo "Symlink erstellt: /usr/local/bin/gunicorn -> $GUNICORN_PATH"
fi

echo "--- Build-Prozess abgeschlossen ---"
