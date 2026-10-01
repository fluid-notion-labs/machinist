#!/usr/bin/env bash
# 45-android.sh - android sdk and java
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export ANDROID_SDK_ROOT="${ANDROID_SDK_ROOT:-$ANDROID_HOME}"

# resolve the java install (any openjdk >= 17)
if command -v java &>/dev/null; then
    JAVA_HOME="${JAVA_HOME:-$(dirname "$(dirname "$(readlink -f "$(command -v java)")")")}"
fi
export JAVA_HOME

[ -d "$ANDROID_HOME" ] && export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
[ -d "$JAVA_HOME" ] && export PATH="$JAVA_HOME/bin:$PATH"
