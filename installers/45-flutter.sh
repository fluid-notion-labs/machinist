#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

FLUTTER_ROOT="${FLUTTER_ROOT:-$HOME/development/flutter}"

# flutter installs itself as a git repo, so it needs git on PATH
export PATH="$(dirname "$(command -v git)"):$PATH"

if [ -f "$FLUTTER_ROOT/bin/flutter" ]; then
    echo "flutter already installed, upgrading..."
    "$FLUTTER_ROOT/bin/flutter" upgrade
else
    mkdir -p "$(dirname "$FLUTTER_ROOT")"

    # fetch latest stable version from flutter's release channel manifest
    RELEASES_JSON=$(curl -fsSL https://storage.googleapis.com/flutter_infra_release/releases/releases_linux.json)
    CURRENT_STABLE=$(echo "$RELEASES_JSON" | jq -r '.current_release.stable')
    ARCHIVE_PATH=$(echo "$RELEASES_JSON" | jq -r --arg h "$CURRENT_STABLE" \
        '.releases[] | select(.hash == $h and .channel == "stable") | .archive')

    tmp=$(mktemp -d)
    trap 'rm -rf "$tmp"' EXIT

    echo "downloading flutter stable: $ARCHIVE_PATH"
    curl -fL "https://storage.googleapis.com/flutter_infra_release/releases/$ARCHIVE_PATH" -o "$tmp/flutter.tar.xz"

    tar -xf "$tmp/flutter.tar.xz" -C "$(dirname "$FLUTTER_ROOT")"
fi

"$FLUTTER_ROOT/bin/flutter" config --no-analytics
"$FLUTTER_ROOT/bin/flutter" precache
"$FLUTTER_ROOT/bin/flutter" doctor
