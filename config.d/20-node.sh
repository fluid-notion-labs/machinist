#!/usr/bin/env bash
# 20-node.sh - nvm and node

export NVM_DIR="${NVM_DIR:-$HOME/.config/nvm}"

set +u
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
set -u
