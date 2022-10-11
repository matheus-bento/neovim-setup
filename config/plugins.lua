packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    use 'Mofiqul/dracula.nvim' -- Dracula theme

    -- Synchronizes packages on every startup cycle
    packer.sync()
end)
