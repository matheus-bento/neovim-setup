-- Configuration for the internal terminal using toggleterm
require'toggleterm'.setup {
	size = 14
}

local opts = { noremap=true, silent=true }

vim.keymap.set('n', '<leader>t', ':ToggleTerm<CR>', opts)

