packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use 'nvim-tree/nvim-web-devicons'
    use 'nvim-tree/nvim-tree.lua' -- Tree-view

    use 'Mofiqul/dracula.nvim' -- Dracula theme

    use 'feline-nvim/feline.nvim' -- Git status bar
    use 'lewis6991/gitsigns.nvim' -- Git utilities for the text editor

    -- Synchronizes packages on every startup cycle
    packer.sync()
end)
