#!/usr/bin/with-contenv bash

echo "[DEBUG] Start executing 56-openboxcopy."
echo "[DEBUG] Checking for /config/.config/openbox/menu.xml"

# default file copies first run
if [[ ! -f /config/.config/openbox/menu.xml ]]; then
    echo "[DEBUG] File not found, creating directories..."
    mkdir -p /config/.config/openbox

    echo "[DEBUG] Copying /defaults/menu.xml to /config/.config/openbox/menu.xml"
    cp /defaults/menu.xml /config/.config/openbox/menu.xml

    echo "[DEBUG] Setting owner abc:abc for /config/.config"
    chown -R abc:abc /config/.config
else
    echo "[DEBUG] File already exists: /config/.config/openbox/menu.xml"
    ls -l /config/.config/openbox/menu.xml
fi

echo "[DEBUG] Contents of /config/.config/openbox directory:"
ls -l /config/.config/openbox


# --- Добавляем создание /tmp/.X11-unix ---
echo "[DEBUG] Ensuring /tmp/.X11-unix exists with correct permissions"
mkdir -p /tmp/.X11-unix
chmod 1777 /tmp/.X11-unix
echo "[DEBUG] /tmp/.X11-unix permissions:"
ls -ld /tmp/.X11-unix


echo "[DEBUG] End executing 56-openboxcopy."
