#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

DCONF_FILE="$(dirname "$0")/../dotfiles/dconf.ini"

if [ ! -f "$DCONF_FILE" ]; then
    echo "no dconf.ini found, skipping"
    exit 0
fi

dconf load / < "$DCONF_FILE"
echo "dconf settings applied"
