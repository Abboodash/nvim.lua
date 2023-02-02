local M = {
    "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
    local null_ls = require("null-ls")

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    local sources = {
        formatting.rustfmt,
        formatting.prettier,
        formatting.stylua,
        formatting.csharpier,
        formatting.autopep8,
        formatting.beautysh,
        require("typescript.extensions.null-ls.code-actions"),
    }

    null_ls.setup({
        sources = sources,

        on_attach = function(client, bufnr)
            if client.supports_method("textDocument/formatting") then
                vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({ bufnr = bufnr })
                    end,
                })
            end
        end,
    })
end

return M
