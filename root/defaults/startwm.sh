#!/bin/bash

echo "[DEBUG] $(date) — start script executed"

# Запускаем PulseAudio (если нужен звук)
if [[ -x /startpulse.sh ]]; then
    echo "[DEBUG] /startpulse.sh found, starting PulseAudio..."
    /startpulse.sh >> /tmp/startpulse.log 2>&1 &
    echo "[DEBUG] PulseAudio started, PID=$!"
else
    echo "[DEBUG] /startpulse.sh NOT FOUND, skipping PulseAudio"
fi

# Запускаем Openbox
if [[ -x /usr/bin/openbox-session ]]; then
    echo "[DEBUG] /usr/bin/openbox-session found, starting Openbox..."
    /usr/bin/openbox-session >> /tmp/openbox.log 2>&1
    echo "[DEBUG] Openbox finished (usually the container stops when Openbox exits)"
else
    echo "[ERROR] /usr/bin/openbox-session NOT FOUND!"
fi

echo "[DEBUG] $(date) — start script finished"
