#!/bin/bash

SETUP_SCRIPT_DIR="$(dirname $(realpath "$0"))"

# Neovim nightly installation
# Reference: https://github.com/neovim/neovim/wiki/Building-Neovim

echo -e "\n=================== Installing neovim ===================\n"

if [ -z "$(ls ~/repositories/neovim 2>/dev/null)" ]; then
    git clone https://github.com/neovim/neovim ~/repositories/neovim
else
    echo "Neovim already cloned into ~/repositories"
fi

cd ~/repositories/neovim
git checkout nightly

# neovim build dependencies
sudo apt-get install -y cmake libtool-bin unzip gettext

make CMAKE_BUILD_TYPE=Release
sudo make install

sudo ln -s /usr/local/bin/nvim /usr/local/bin/neovim

echo -e "\n============= Neovim successfully installed =============\n"

echo -e "======================== Plugins ========================\n"

echo -e "The following plugins will be installed:\n \
\t- wbthomason/packer.nvim:       Package management tool;\n \
\t- neovim/nvim-lspconfig:        Quickstart configurations for the Language Server Protocol (LSP);\n \
\t- nvim-tree/nvim-tree.lua:      Tree-view for neovim;\n \
\t- Mofiqul/dracula.nvim:         Dark theme for neovim.\n"

# packer.nvim installation

# Package manager for nvim.
# Reference: https://github.com/wbthomason/packer.nvim

git clone https://github.com/wbthomason/packer.nvim \
          ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Setting up nvim init.lua
mkdir -p ~/.config/nvim/
cp $SETUP_SCRIPT_DIR/config/init.lua ~/.config/nvim

# Setting up the plugin configuration file
mkdir -p ~/.config/nvim/lua
cp $SETUP_SCRIPT_DIR/config/plugins.lua ~/.config/nvim/lua/

# Setting up Language Server Protocol (LSP) implementations.
# Reference on LSP: https://microsoft.github.io/language-server-protocol/

sudo apt-get install -y python3-pip
pip install pyright

echo -e "\n============ Plugins successfully installed ============="

PATH=$PATH:$HOME/.local/bin

echo -e "=============== Neovim successfully setup ==============="
echo -e "\nWARNING: Neovim was configured to synchronize packages on every startup. The first startup cycle will result in \n\
an error message due to missing packages, it is resolved immediately after startup as the packages are synced up automatically."
