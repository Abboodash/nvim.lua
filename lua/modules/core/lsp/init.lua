local M = {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {'williamboman/mason.nvim'},           -- Optional
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},         -- Required
        {'hrsh7th/cmp-nvim-lsp'},     -- Required
        {"hrsh7th/cmp-cmdline"},      -- Optional
        {'hrsh7th/cmp-buffer'},       -- Optional
        {'hrsh7th/cmp-path'},         -- Optional
        {'saadparwaiz1/cmp_luasnip'}, -- Optional
        {'hrsh7th/cmp-nvim-lua'},     -- Optional

        -- Formatting
        {"jose-elias-alvarez/null-ls.nvim"}, -- Required
        {"jay-babu/mason-null-ls.nvim"}, -- Optional

        -- Snippets
        {'L3MON4D3/LuaSnip'},             -- Required
        {"onsails/lspkind.nvim"},         -- Required
        {'rafamadriz/friendly-snippets'}, -- Optional

        -- DAPs
        {"mfussenegger/nvim-dap"},
        {"rcarriga/nvim-dap-ui"},     
        {"jay-babu/mason-nvim-dap.nvim"},

        -- Other
        {"SmiteshP/nvim-navic"},
        {"jose-elias-alvarez/typescript.nvim"},
        {"folke/neodev.nvim"},
        {"simrat39/rust-tools.nvim"},
        {"Hoffs/omnisharp-extended-lsp.nvim"},

    }
}

function M.config()
    require('mason.settings').set({
        ui = {
            border = 'rounded'
        }
    })

    local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        manage_nvim_cmp = false,
        suggest_lsp_servers = false,
    })


    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace()

    lsp.ensure_installed({
        "rust_analyzer",
        "tsserver",
        "pyright",
        "lua_ls",
        "omnisharp_mono",
        "bashls",
        "nil_ls",
    })

    local settings = {}

    settings.capabilities = require('cmp_nvim_lsp').default_capabilities()

    settings.lsp_flags = {
        capabilities = settings.capabilities,
        debounce_text_changes = 150,
    }

    function settings.on_attach(client, bufnr)
        if client.server_capabilities["documentSymbolProvider"] then
            require("nvim-navic").attach(client, bufnr)
        end

        -- Enable completion triggered by <c-x><c-o>
        vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

        -- Mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
        vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
        vim.keymap.set("n", "<A-s>", "<Cmd>lua vim.lsp.buf.format { async = true }<CR>", bufopts)
    end

    require("modules.core.lsp.servers").setup(lsp, settings)

    lsp.on_attach(settings.on_attach)

    lsp.setup() 

    require("modules.core.lsp.modules").setup(lsp)
    require("modules.core.lsp.dap").setup()
end

return M
