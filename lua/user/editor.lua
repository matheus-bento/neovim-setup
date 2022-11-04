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

vim.o.tabstop         = 4        -- 4 characters of indentation on tabs
vim.o.shiftwidth      = 4        -- 4 characters of indentation on autoindent by neovim
vim.o.expandtab       = false    -- Insert spaces instead of tabs

vim.o.foldmethod     = 'indent' -- Fold following the file indentation
vim.o.foldlevelstart = 999      -- Setting a high fold level so all blocks are shown on start

vim.opt.colorcolumn = '120' -- Color the 120th column in a different color to use as a ruler

