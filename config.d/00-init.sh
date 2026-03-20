#!/usr/bin/env bash
# 00-init.sh - base PATH and XDG

export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"

# local bin
export PATH="$HOME/.local/bin:$PATH"
