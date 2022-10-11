-- Loads packer.nvim plugin configurations setup on plugins.lua
require('plugins')

-- Setting up python language server
require('lspconfig').pyright.setup{}

-- Setting up the dracula theme
vim.cmd[[colorscheme dracula]]