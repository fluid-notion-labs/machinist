#!/usr/bin/env bash
set -euo pipefail
source "$(dirname "$0")/../lib/config.sh"

ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
CMDLINE_TOOLS_VERSION="13114758"  # latest root from https://developer.android.com/studio

CMDLINE_TOOLS_DIR="$ANDROID_HOME/cmdline-tools/latest"

if [ -x "$CMDLINE_TOOLS_DIR/bin/sdkmanager" ]; then
    echo "android cmdline-tools already installed, updating..."
    "$CMDLINE_TOOLS_DIR/bin/sdkmanager" --update
else
    mkdir -p "$ANDROID_HOME/cmdline-tools"
    tmp=$(mktemp -d)
    trap 'rm -rf "$tmp"' EXIT

    echo "downloading android cmdline-tools $CMDLINE_TOOLS_VERSION"
    curl -fL "https://dl.google.com/android/repository/commandlinetools-linux-${CMDLINE_TOOLS_VERSION}_latest.zip" \
        -o "$tmp/tools.zip"

    mkdir -p "$tmp/cmdline-tools"
    unzip -q "$tmp/tools.zip" -d "$tmp/cmdline-tools"
    rm -rf "$CMDLINE_TOOLS_DIR"
    mkdir -p "$(dirname "$CMDLINE_TOOLS_DIR")"
    mv "$tmp/cmdline-tools/cmdline-tools" "$CMDLINE_TOOLS_DIR"
fi

SDKMANAGER="$CMDLINE_TOOLS_DIR/bin/sdkmanager"

# accepts all remaining sdk licenses non-interactively
# (`yes` exits 141 on SIGPIPE, so pipefail would abort the script without this)
yes | "$SDKMANAGER" --licenses > /dev/null || true

"$SDKMANAGER" \
    "platform-tools" \
    "platforms;android-36" \
    "build-tools;36.0.0"
