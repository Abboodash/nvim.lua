local M = {}

function M.setup(lsp, on_attach, lsp_flags)
    local path = "modules.core.lsp.servers."
    
    local servers = {
        "typescript",
        "rust",
        "omnisharp",
    }

    for _, server in ipairs(servers) do
        require(path .. server).setup(lsp, on_attach, lsp_flags)
    end
end

return M
