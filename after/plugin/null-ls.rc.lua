local status, null_ls = pcall(require, 'null-ls')
if (not status) then return end

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local sources = {
    formatting.nixfmt,
    require('typescript.extensions.null-ls.code-actions')
}

null_ls.setup({
    sources = sources,
    on_attach = function(client, bufnr)
        if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end
            })
        end
    end
})

local ensure_installed = {
    'rustfmt',
    'prettierd',
    'luaformatter',
    'csharpier',
    'autopep8',
    'beautysh',
    'shellcheck'
}

require('mason-null-ls').setup({
    ensure_installed = ensure_installed,
    automatic_installation = true,
    automatic_setup = true
})

-- Required when `automatic_setup` is true
require('mason-null-ls').setup_handlers()
