#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

NVM_VERSION="v0.40.1"

if [ -d "$NVM_DIR" ]; then
    echo "nvm already installed"
else
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash
fi

source "$NVM_DIR/nvm.sh"

nvm install --lts
nvm use --lts
