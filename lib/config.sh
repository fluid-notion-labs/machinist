#!/usr/bin/env bash
# machinist - source all config.d files in order
MACHINIST_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for f in "$MACHINIST_DIR"/config.d/[0-9]*.sh; do
    [ -r "$f" ] && source "$f" || true
done
