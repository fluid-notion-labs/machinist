#!/usr/bin/env bash
set -euo pipefail

MACHINIST_REPO="https://github.com/fluid-notion-labs/machinist"
MACHINIST_DIR="$HOME/.local/share/machinist"

echo "==> installing git"
#sudo apt update
sudo apt install -y git

echo "==> cloning machinist"
git clone "$MACHINIST_REPO" "$MACHINIST_DIR"

echo "==> running installer"
cd "$MACHINIST_DIR"
chmod +x install.sh installers/*.sh
bash install.sh
