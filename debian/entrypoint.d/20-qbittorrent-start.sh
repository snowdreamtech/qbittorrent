#!/bin/sh
set -e

if [ "$DEBUG" = "true" ]; then echo "→ [qbittorrent] Starting qbittorrent..."; fi

# qbittorrent-nox
# qbittorrent-nox --profile=/var/lib --confirm-legal-notice
qbittorrent-nox --profile=/var/lib

if [ "$DEBUG" = "true" ]; then echo "→ [qbittorrent] Qbittorrent started."; fi
