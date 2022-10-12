local M = {}

function M.setup()
    -- configures debugger that should be automatically installed
    vim.g.vimspector_install_gadgets = { "debugpy", "netcoredbg" }
    vim.cmd('packadd! vimspector')
end

return M
