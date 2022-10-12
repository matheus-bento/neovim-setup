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
\t- puremourning/vimspector:      Debugging GUI for neovim\n \
\t- lewis6991/gitsigns.nvim:      Git editor utilities;\n \
\t- feline-nvim/feline.nvim:      Git status bar;\n \
\t- Mofiqul/dracula.nvim:         Dark theme for neovim.\n"

# packer.nvim installation

# Package manager for nvim.
# Reference: https://github.com/wbthomason/packer.nvim

git clone https://github.com/wbthomason/packer.nvim \
          ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Setting up nvim init.lua
mkdir -p ~/.config/nvim/
cp $SETUP_SCRIPT_DIR/lua/init.lua ~/.config/nvim

# Setting up the plugin configuration file
mkdir -p ~/.config/nvim/lua
cp $SETUP_SCRIPT_DIR/lua/plugins.lua ~/.config/nvim/lua/

# Setting up vimspector configuration file
mkdir -p ~/.config/nvim/lua/config
cp $SETUP_SCRIPT_DIR/lua/config/vimspector.lua ~/.config/nvim/lua/config

# Setting up Language Server Protocol (LSP) implementations.
# Reference on LSP: https://microsoft.github.io/language-server-protocol/

# Python LSP

sudo apt-get install -y python3-pip
pip install pyright

# C# LSP
cd $SETUP_SCRIPT_DIR
sudo mkdir /usr/local/bin/omnisharp

curl -LO https://github.com/OmniSharp/omnisharp-roslyn/releases/download/v1.39.1/omnisharp-linux-x64-net6.0.tar.gz
sudo tar -xvf omnisharp-linux-x64-net6.0.tar.gz --directory /usr/local/bin/omnisharp

rm ./omnisharp-linux-x64-net6.0.tar.gz 

echo -e "\n============ Plugins successfully installed ============="

PATH=$PATH:$HOME/.local/bin

echo -e "=============== Neovim successfully setup ==============="

echo -e "\nWARNING: Neovim was configured to synchronize packages on every startup. The first startup cycle will result in \n\
an error message due to missing packages, it is resolved immediately after startup as the packages are synced up automatically."

echo -e "\nWARNING: In order to use Vimspector's GUI, you will need to manually trigger the installation for the configured \n\
debugging fronteds by running :VimspectorInstall"

