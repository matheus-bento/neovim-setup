-- Installs the vimspector plugin

-- Due to being a vim plugin, without native support for lua, it's
-- managed in a slighly different way to make it look like a regular 
-- plugin on init.lua

local M = {}

function M.setup()
	-- Configures debugger that should be automatically installed
	vim.g.vimspector_install_gadgets = { 'debugpy', 'netcoredbg', 'vscode-node-debug2', 'delve' }
	vim.g.vimspector_enable_mappings = 'VISUAL_STUDIO'
	vim.cmd [[packadd! vimspector]]
end

return M
