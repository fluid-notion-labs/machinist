#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

PACKAGES_FILE="$(dirname "$0")/../packages/uv.txt"

while IFS= read -r pkg; do
    [[ "$pkg" =~ ^#|^$ ]] && continue
    echo "installing uv tool: $pkg"
    uv tool install "$pkg"
done < "$PACKAGES_FILE"
