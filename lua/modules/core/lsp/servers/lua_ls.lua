local M = {}

function M.setup(lsp, settings)
    lsp.configure("lua_ls", {
        on_attach = settings.on_attach,
        flags = settings.lsp_flags,

        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    globals = { "vim" },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                    maxPreload = 100000,
                    preloadFileSize = 10000,
                },
                telemetry = {
                    enable = false,
                },                
            },
        }, 
    })
end

return M
