local M = {}

function M.setup(lsp, settings)
    local path = "modules.core.lsp.servers."
    
    local servers = {
        "lua_ls",
        "omnisharp_mono",
        "rust_analyzer",
        "tsserver",
    }

    for _, server in ipairs(servers) do
        require(path .. server).setup(lsp, settings)
    end
end

return M
