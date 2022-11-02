-- Sets up the LSP servers for neovim

local opts = { noremap=true, silent=true }

-- LSP mappings based on neovim/nvim-lspconfig suggested key mappings for LSP
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
    vim.keymap.set('n', '<space>f',  vim.lsp.buf.format,                   bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- Binding on_attach_lsp and lsp_flags to each installed language server
local lsp_servers = { 'pyright', 'omnisharp', 'tsserver', 'gopls' }

for _, lsp in ipairs(lsp_servers) do
    local lsp_config = {
        on_attach = on_attach_lsp,
        flags = lsp_flags,
    }

    if lsp == 'omnisharp' then
        lsp_config.cmd = { "dotnet", "/usr/local/bin/omnisharp/OmniSharp.dll" }
    end

    require('lspconfig')[lsp].setup(lsp_config)
end

