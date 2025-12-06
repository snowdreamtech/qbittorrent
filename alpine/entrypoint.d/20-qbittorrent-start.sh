#!/bin/sh
set -e

if [ "$DEBUG" = "true" ]; then echo "→ [qbittorrent] Starting qbittorrent..."; fi

# qbittorrent-nox
qbittorrent-nox --profile=/var/lib --confirm-legal-notice

# flood
if [ "${FLOOD_AUTH}" = "default" ]; then
    flood --host 0.0.0.0 --port "${FLOOD_PORT}" --auth default --qburl "http://localhost:${WEBUI_PORT}" --qbuser "${WEBUI_USER}" --qbpass "${WEBUI_PASS}" >/dev/null 2>&1 &
else
    flood --host 0.0.0.0 --port "${FLOOD_PORT}" --auth none --qburl "http://localhost:${WEBUI_PORT}" --qbuser "${WEBUI_USER}" --qbpass "${WEBUI_PASS}" >/dev/null 2>&1 &
fi

if [ "$DEBUG" = "true" ]; then echo "→ [qbittorrent] Qbittorrent started."; fi
