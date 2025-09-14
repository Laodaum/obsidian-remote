#!/usr/bin/with-contenv bash

echo "[DEBUG] $(date) — Autostart script started"

# Проверяем, существует ли бинарь Obsidian
if [[ -x /usr/bin/obsidian ]]; then
    echo "[DEBUG] /usr/bin/obsidian found, permissions:"
    ls -l /usr/bin/obsidian

    echo "[DEBUG] Starting Obsidian with parameters..."
    /usr/bin/obsidian --no-sandbox --no-xshm --disable-dev-shm-usage --disable-gpu --disable-software-rasterize \
        >> /tmp/obsidian.log 2>&1 &
    echo "[DEBUG] Obsidian started, PID=$!"
else
    echo "[ERROR] /usr/bin/obsidian NOT FOUND!"
fi
