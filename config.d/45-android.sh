#!/usr/bin/env bash
# 45-android.sh - android sdk and java
export ANDROID_HOME="${ANDROID_HOME:-$HOME/Android/Sdk}"
export ANDROID_SDK_ROOT="${ANDROID_SDK_ROOT:-$ANDROID_HOME}"
export JAVA_HOME="${JAVA_HOME:-/usr/lib/jvm/java-17-openjdk-amd64}"

[ -d "$ANDROID_HOME" ] && export PATH="$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools:$PATH"
[ -d "$JAVA_HOME" ] && export PATH="$JAVA_HOME/bin:$PATH"
