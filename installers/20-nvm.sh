#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

NVM_VERSION="v0.40.1"
NVM_DIR_BACKUP=$NVM_DIR
if [ -d "$NVM_DIR" ]; then
    echo "nvm already installed"
else
    unset NVM_DIR
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh" | bash
fi
NVM_DIR=$NVM_DIR_BACKUP
set +u
source "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts
set -u
