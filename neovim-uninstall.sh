#!/bin/bash

echo "===================== Removing neovim ==================="
sudo rm /usr/local/bin/nvim
sudo rm /usr/local/bin/neovim

echo "============ Removing neovim configurations ============="
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

echo "==================== Neovim removed ====================="



