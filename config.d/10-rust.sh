#!/usr/bin/env bash
# 10-rust.sh - rustup and cargo
export CARGO_HOME="${CARGO_HOME:-$HOME/.cargo}"
export RUSTUP_HOME="${RUSTUP_HOME:-$HOME/.rustup}"

[ -f "$CARGO_HOME/env" ] && source "$CARGO_HOME/env"
