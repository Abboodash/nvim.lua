local M = {
'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Formatting
    {"jose-elias-alvarez/null-ls.nvim"}, -- Required

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {"hrsh7th/cmp-cmdline"},      -- Optional
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
	{"onsails/lspkind.nvim"},         -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  
    -- Other
    {"SmiteshP/nvim-navic"},
    {"jose-elias-alvarez/typescript.nvim"},
    {"folke/neodev.nvim"},
    {"simrat39/rust-tools.nvim"},
    {"mfussenegger/nvim-dap"},
    {"rcarriga/nvim-dap-ui"},     
    {"Hoffs/omnisharp-extended-lsp.nvim"},

    }
}

function M.config()
   local lsp = require('lsp-zero').preset({
        name = 'minimal',
        set_lsp_keymaps = true,
        manage_nvim_cmp = true,
        suggest_lsp_servers = false,
    })

	local luasnip = require("luasnip")
	local cmp = require("cmp")
	local lspkind = require("lspkind")

    -- (Optional) Configure lua language server for neovim
    lsp.nvim_workspace()

    lsp.ensure_installed({
            -- LSPs
            "rust_analyzer",
            "tsserver",
            "pyright",
            "lua_ls",
            "omnisharp_mono",
            "bashls",
            "nil_ls",

            -- -- DAPs
            -- "codelldb",
            -- 
            -- --formatters
            -- "rustfmt",
            -- "prettier",
            -- "stylua",
            -- "csharpier",
            -- "autopep8",
            -- "beautysh",
            -- -- "nixfmt", 
    })

    lsp.setup_nvim_cmp({
        window = {
			completion = cmp.config.window.bordered({
				winhighlight = "Normal:Normal,FloatBorder:BorderBG,CursorLine:PmenuSel,Search:None",
			}),
		},
        sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
		},
		formatting = {
			format = lspkind.cmp_format({
				with_text = true,
				maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

				-- The function below will be called before any actual modifications from lspkind
				-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
				before = function(entry, vim_item)
					vim_item.menu = entry:get_completion_item().detail
					return vim_item
				end,
			}),
		},
    })

    lsp.on_attach(function(client, bufnr)
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
    end)

    vim.cmd("highlight! BorderBG guibg=NONE guifg=#7190ca")
    lsp.setup() 

    require("modules.core.lsp.neodev")
    require("modules.core.lsp.dap.dapui")
    require("modules.core.lsp.null-ls")

end

return M
