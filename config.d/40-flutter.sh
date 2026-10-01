#!/usr/bin/env bash
# 40-flutter.sh - flutter sdk and dart pub cache
export FLUTTER_ROOT="${FLUTTER_ROOT:-$HOME/development/flutter}"
export PUB_CACHE="${PUB_CACHE:-$HOME/.pub-cache}"

[ -d "$FLUTTER_ROOT/bin" ] && export PATH="$FLUTTER_ROOT/bin:$PATH"
