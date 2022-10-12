require('plugins')             -- Loads packer.nvim plugin configurations setup on plugins.lua

vim.o.number        = true     -- Enabling line numbers
vim.o.termguicolors = true     -- Enabling termguicolors for feline

vim.opt.list = true
vim.opt.listchars = {
    tab   = '→ ',
    eol   = '↵',
    space = '◦',
}

vim.o.tabstop       = 4        -- 4 characters of indentation on tabs
vim.o.shiftwidth    = 4        -- 4 characters of indentation on autoindent by neovim
vim.o.expandtab     = true     -- Insert spaces instead of tabs

vim.cmd('colorscheme dracula') -- Setting up the dracula theme

vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'
require('config.vimspector').setup()

require('winbar').setup {
    enabled = true
}

require('nvim-tree').setup()
require('feline').setup()
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

-- Custom key mappings

local opts = { noremap=true, silent=true }

vim.keymap.set('n', 'gb', ':Gitsigns toggle_current_line_blame<CR>', opts)
vim.keymap.set('n', 'gs', ':Gitsigns toggle_signs<CR>', opts)
vim.keymap.set('n', 't', ':NvimTreeToggle<CR>', opts)

-- LSP mappings. Based on neovim/nvim-lspconfig suggested key mappings for LSP
-- Reference: https://github.com/neovim/nvim-lspconfig#suggested-configuration

-- See `:help vim.diagnostic.*` for documentation on any of the below functions

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d',       vim.diagnostic.goto_prev,  opts)
vim.keymap.set('n', ']d',       vim.diagnostic.goto_next,  opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Maps the following keys after the language server attaches to the current
-- buffer
local on_attach_lsp = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD',        vim.lsp.buf.declaration,              bufopts)
    vim.keymap.set('n', 'gd',        vim.lsp.buf.definition,               bufopts)
    vim.keymap.set('n', 'gi',        vim.lsp.buf.implementation,           bufopts)
    vim.keymap.set('n', 'gr',        vim.lsp.buf.references,               bufopts)
    
    vim.keymap.set('n', 'K',         vim.lsp.buf.hover,                    bufopts)
    
    vim.keymap.set('n', '<C-k>',     vim.lsp.buf.signature_help,           bufopts)
    
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder,     bufopts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder,  bufopts)

    vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    
    vim.keymap.set('n', '<space>D',  vim.lsp.buf.type_definition,          bufopts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename,                   bufopts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action,              bufopts)
    vim.keymap.set('n', '<space>f',  vim.lsp.buf.format({ async = true }), bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- Binding on_attach_lsp and lsp_flags to each installed language server

-- Python LSP
require('lspconfig').pyright.setup {
    on_attach = on_attach_lsp,
    flags = lsp_flags,
}

-- C# LSP
require('lspconfig').omnisharp.setup {
    -- The cmd should point to the same OmniSharp installation path
    -- defined on neovim-install.sh
    cmd = { "dotnet", "/usr/local/bin/omnisharp/OmniSharp.dll" },
    on_attach = on_attach_lsp,
    flags = lsp_flags,
}
