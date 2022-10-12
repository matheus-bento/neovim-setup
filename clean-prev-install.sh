#!/usr/bin/env bash

# Cleans previous configurations and plugins
if [[ -e "$HOME/.config/nvim" ]]; then
    rm -rf "$HOME/.config/nvim"
fi
