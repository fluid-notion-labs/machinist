#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

PACKAGES_FILE="$(dirname "$0")/../packages/node.txt"

while IFS= read -r pkg; do
    [[ "$pkg" =~ ^#|^$ ]] && continue
    echo "installing npm global: $pkg"
    npm install -g "$pkg"
done < "$PACKAGES_FILE"
