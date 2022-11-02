-- Manages installed plugins

-- Verifies if packer is installed, if it's not it clones packer and installs for us
local packer_installed = function()
	local packer_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

	if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
		vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = packer_installed()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- Package manager
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-tree/nvim-tree.lua' -- Tree-view

	use 'Mofiqul/dracula.nvim' -- Dracula theme

	use 'fgheng/winbar.nvim' -- Navigation breadcrumb
	use 'romgrk/barbar.nvim' -- Prettier tabs plugin

	use 'feline-nvim/feline.nvim' -- Git status bar
	use 'lewis6991/gitsigns.nvim' -- Git utilities for the text editor

	use 'puremourning/vimspector' -- Debugging frontend for neovim

	if packer_bootstrap then
		-- Synchronizes once packer is installed
		require('packer').sync()
	end
end)
