local M = {}

function M.setup(lsp, on_attach, lsp_flags)
    lsp.configure("omnisharp_mono", {
        on_attach = function(client, bufnr)
            local pid = vim.fn.getpid()
            local omnisharp_bin = vim.env.HOME .. "/.local/share/nvim/mason/packages/omnisharp-mono/run"

            lspconfig["omnisharp_mono"].setup({
                on_attach = on_attach,
                flags = lsp_flags,

                handlers = {
                    ["textDocument/definition"] = require("omnisharp_extended").handler,
                },
                cmd = { omnisharp_bin, "--languageserver", "--hostPID", tostring(pid) },

                enable_roslyn_analyzers = true,
                organize_imports_on_format = true,
                enable_import_completion = true,
            })
        end
    })
end

return M
