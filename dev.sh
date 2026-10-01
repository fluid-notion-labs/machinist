#!/usr/bin/env bash
# dev sync: push this repo's machinist files into the live install,
# so .bashrc picks up config.d changes via the real install path.
# never touches the live install's machine-specific overrides.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LIVE_DIR="${MACHINIST_LIVE_DIR:-$HOME/.local/share/machinist}"

[ -d "$LIVE_DIR" ] || { echo "no live install at $LIVE_DIR (run bootstrap.sh first)"; exit 1; }

rsync -av --delete \
    --exclude '.git/' \
    --exclude '.gitignore' \
    --exclude 'config.d/99-local.sh' \
    "$SCRIPT_DIR"/README.md "$SCRIPT_DIR"/bootstrap.sh "$SCRIPT_DIR"/install.sh \
    "$SCRIPT_DIR"/config.d "$SCRIPT_DIR"/installers "$SCRIPT_DIR"/lib "$SCRIPT_DIR"/packages \
    "$LIVE_DIR/"

echo
echo "synced $SCRIPT_DIR -> $LIVE_DIR"
echo "re-source with: . ~/.bashrc"
