#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

PACKAGES_FILE="$(dirname "$0")/../packages/cargo.txt"

while IFS= read -r pkg; do
    [[ "$pkg" =~ ^#|^$ ]] && continue
    echo "installing cargo: $pkg"
    cargo install $pkg
done < "$PACKAGES_FILE"
