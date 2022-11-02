require('user.plugins')
require('user.editor')
require('user.theme')
require('user.nvim_tree')
require('user.gitsigns')
require('user.lspconfig')
require('winbar').setup {
    enabled = true
}
require('vimspector').setup()
require('nvim-tree').setup()
require('feline').setup()

