#!/usr/bin/env bash

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

case "$1" in
    "setenv")
    export LD_LIBRARY_PATH="$THIS_DIR/build/exe.linux-x86_64-3.6/lib"
    ;;
    esac

$THIS_DIR/build/exe.linux-x86_64-3.6/theapp
