packer = require('packer')

return packer.startup(function(use)
    use 'wbthomason/packer.nvim' -- Package manager
    use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

    packer.sync()
end)
