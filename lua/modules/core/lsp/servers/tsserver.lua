local M = {}

function M.setup(lsp, settings)
    lsp.configure("tsserver", {
        on_attach = function(client, bufnr)
            require("typescript").setup({
                disable_commands = false, -- prevent the plugin from creating Vim commands
                debug = false, -- enable debug logging for commands
                go_to_source_definition = {
                    fallback = true, -- fall back to standard LSP definition on failure
                },
                server = { -- pass options to lspconfig's setup method
                    on_attach = settings.on_attach,
                    flags = settings.lsp_flags,
                },
            })
        end
    })
end

return M
