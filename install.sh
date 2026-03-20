#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"
source lib/config.sh

log() { echo -e "\n\033[1;34m==>\033[0m \033[1m$*\033[0m"; }

for f in "$MACHINIST_DIR"/installers/[0-9]*.sh; do
    [ -r "$f" ] || continue
    echo -e "\n\033[1;34m==>\033[0m \033[1m$f\033[0m"
    bash "$f"
    for c in "$MACHINIST_DIR"/config.d/[0-9]*.sh; do
        [ -r "$c" ] && . "$c" || true
    done
done

log "adding machinist to .bashrc"
BASHRC="$HOME/.bashrc"
MARKER="# machinist"
if ! grep -q "$MARKER" "$BASHRC"; then
    echo -e "\n$MARKER\nsource $SCRIPT_DIR/lib/config.sh" >> "$BASHRC"
    echo "added to .bashrc"
else
    echo "already in .bashrc, skipping"
fi

log "done! restart shell or: source ~/.bashrc"
