#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

source lib/config.sh

log() { echo -e "\n\033[1;34m==>\033[0m \033[1m$*\033[0m"; }

log "apt packages"
bash installers/apt.sh

log "rustup"
bash installers/rustup.sh

log "cargo packages"
bash installers/rust.sh

log "nvm"
bash installers/nvm.sh

log "node global packages"
bash installers/node.sh

log "uv"
bash installers/uv.sh

log "uv tools"
bash installers/uv-tools.sh

log "dconf settings"
bash installers/dconf.sh

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
