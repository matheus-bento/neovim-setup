require('user.plugins')
require('user.theme')
require('user.editor')
require('user.nvim_tree')
require('user.gitsigns')
require('user.lspconfig')
require('winbar').setup {
    enabled = true
}
require('vimspector').setup()
require('nvim-tree').setup()
require('feline').setup()

