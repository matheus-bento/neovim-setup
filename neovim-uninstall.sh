#!/bin/bash

echo "===================== Removing neovim ==================="
sudo rm /usr/local/bin/nvim
sudo rm /usr/local/bin/neovim
sudo rm -rf /usr/local/bin/omnisharp

echo "============ Removing neovim configurations ============="
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

echo "==================== Neovim removed ====================="

