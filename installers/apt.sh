#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

PACKAGES_FILE="$(dirname "$0")/../packages/apt.txt"

sudo apt update
grep -v '^\s*#' "$PACKAGES_FILE" | grep -v '^\s*$' | xargs sudo apt install -y
