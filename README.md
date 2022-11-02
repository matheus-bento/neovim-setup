# neovim-setup

My personal neovim setup with plugins, themes and editor settings I use.

![nvim setup screenshot](https://user-images.githubusercontent.com/48458069/195466391-39a7f8ea-d831-405b-aa3e-7f91f45a90d1.png)

## Installation

Clone this repo in ~/.config/nvim (you should clean any previous neovim configurations in the directory before this) and run install.sh, this will install neovim nightly and some LSP implementations. 
Be patient! Compiling neovim from source can take some time. The lua configuration files will be immediatelly identified by neovim on start.

To install the debuggers used by vimspector, run :VimspectorInstall at your first startup.

## Upgrading

You can keep the repository after installation in order to get updates with new configurations and plugins. Just pull from the remote to get the most recent configuration.
Changes to lua configuration files will be immediatelly detected after pulling new versions, for plugins start neovim and run 
:PackerSync to install any missing plugins.

## Plugins

- [packer.nvim](https://github.com/wbthomason/packer.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip)
- [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons)
- [dracula.nvim](https://github.com/Mofiqul/dracula.nvim)
- [winbar.nvim](https://github.com/fgheng/winbar.nvim)
- [barbar.nvim](https://github.com/romgrk/barbar.nvim)
- [feline.nvim](https://github.com/feline-nvim/feline.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [vimspector](https://github.com/puremourning/vimspector)
- [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

## nvim-tree icons

This setup uses nvim-web-devicons to have prettier symbols on the tree view. The plugin requires [a patched font](https://www.nerdfonts.com/) to display those symbols correctly.
Since I'm currently using neovim from a WSL environment I won't be adding fonts here, remember to install a font of choice before to avoid missing symbols on tree view.
