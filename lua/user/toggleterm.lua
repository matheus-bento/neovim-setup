-- Configuration for the internal terminal using toggleterm
require'toggleterm'.setup {
	size = 14
}

local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<A-t>', ':ToggleTerm<CR>', opts)

