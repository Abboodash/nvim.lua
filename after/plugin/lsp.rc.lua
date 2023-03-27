local status, lsp = pcall(require, 'lsp-zero')
if (not status) then return end

-- TODO: fix all lsps

require('mason.settings').set({ ui = { border = 'rounded' } })

lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = false,
    suggest_lsp_servers = false
})

lsp.ensure_installed({
    'rust_analyzer',
    'tsserver',
    'lua_ls',
    'omnisharp_mono',
    'nil_ls',
    'jedi_language_server',
    'astro',
    'tailwindcss',
    'cssls',
    'eslint',
    'emmet_ls'
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            runtime = { version = 'LuaJIT' },
            workspace = { library = vim.api.nvim_get_runtime_file('', true) },
            telemetry = { enable = false }
        }
    }
})

lsp.skip_server_setup({ 'tsserver' })

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_flags = { capabilities = capabilities, debounce_text_changes = 150 }

local function on_attach(client, bufnr)
    if client.server_capabilities['documentSymbolProvider'] then
        require('nvim-navic').attach(client, bufnr)
    end

    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', 'gs',
                   '<Cmd>lua vim.lsp.buf.format { async = true }<CR>', bufopts)
end

lsp.on_attach(on_attach)

lsp.setup()

require('typescript').setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    go_to_source_definition = {
        fallback = true -- fall back to standard LSP definition on failure
    },
    server = {
        -- pass options to lspconfig's setup method
        on_attach = on_attach,
        flags = lsp_flags
    }
})

vim.diagnostic.config({ virtual_text = true })

require('mason-nvim-dap').setup({
    ensure_installed = { 'codelldb' },
    automatic_installation = true,
    automatic_setup = true
})

require('mason-nvim-dap').setup_handlers()

local status2, wk = pcall(require, 'which-key')
if (not status2) then return end

wk.register({ m = { name = 'Mason', m = { '<cmd>Mason<cr>', 'Open' } } })
wk.register({ m = { name = 'Mason', m = { '<cmd>Mason<cr>', 'Open' } } })
wk.register({ m = { name = 'Mason', m = { '<cmd>Mason<cr>', 'Open' } } })
wk.register({ m = { name = 'Mason', m = { '<cmd>Mason<cr>', 'Open' } } })
