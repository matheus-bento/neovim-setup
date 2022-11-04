-- Editor settings

vim.o.number        = true     -- Enabling line numbers
vim.o.termguicolors = true     -- Enabling termguicolors for feline
vim.g.mapleader     = '\\'

vim.opt.list = true
vim.opt.listchars = {
	tab   = '→ ',
	eol   = '↵',
	space = '◦',
}

vim.o.tabstop       = 4        -- 4 characters of indentation on tabs
vim.o.shiftwidth    = 4        -- 4 characters of indentation on autoindent by neovim
vim.o.expandtab     = false    -- Insert spaces instead of tabs
