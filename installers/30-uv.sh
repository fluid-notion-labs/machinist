#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

if command -v uv &>/dev/null; then
    echo "uv already installed, updating..."
    uv self update
else
    curl -LsSf https://astral.sh/uv/install.sh | sh
fi
