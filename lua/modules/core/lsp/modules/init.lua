local M = {}

function M.setup(lsp)
    local path = "modules.core.lsp.modules."
    
    local modules = {
        "cmp",
        "null-ls",
        "neodev",
    }

    for _, module in ipairs(modules) do
        require(path .. module).setup(lsp)
    end
end

return M
