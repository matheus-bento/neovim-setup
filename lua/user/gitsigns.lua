-- Sets up the gitsigns plugin

local opts = { noremap=true, silent=true }

vim.keymap.set('n', 'gb', ':Gitsigns toggle_current_line_blame<CR>', opts)
vim.keymap.set('n', 'gs', ':Gitsigns toggle_signs<CR>', opts)
vim.keymap.set('n', 't', ':NvimTreeToggle<CR>', opts)

require('gitsigns').setup {
    signcolumn              = true, -- Signals on columns representing changes on git
    current_line_blame      = true,
    current_line_blame_opts = {
        virt_text         = true,
        virt_text_pos     = 'eol',
        delay             = 0, -- delay in milliseconds
        ignore_whitespace = false,
    }
}

