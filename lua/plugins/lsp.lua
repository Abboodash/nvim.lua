local M = {
    "williamboman/mason.nvim",

    dependencies = {
        -- mason & lsp-config
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",

        -- for barbecue
        "SmiteshP/nvim-navic",

        -- rust
        "simrat39/rust-tools.nvim",
        "mfussenegger/nvim-dap",

        -- omnisharp
        "Hoffs/omnisharp-extended-lsp.nvim",

        -- typescript
        "jose-elias-alvarez/typescript.nvim",
    },
}

function M.config()
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
    })

    require("mason-lspconfig").setup({
        ensure_installed = {
            -- LSPs
            "rust_analyzer",
            "tsserver",
            "pyright",
            "sumneko_lua",
            "omnisharp_mono",
            "bashls",

            --[[        
           --DAPs
            "codelldb",

            --formatters
            "rustfmt",
            "prettier",
            "stylua",
            "csharpier",
            "autopep8",
            "beautysh",
        ]]
        },
        automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local lsp_flags = {
        capabilities = capabilities,
        debounce_text_changes = 150,
    }

    local on_attach = function(client, bufnr)
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

    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

    local extension_path = vim.env.HOME .. "/.local/share/nvim/mason/packages/codelldb/extension/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"

    require("mason-lspconfig").setup_handlers({
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = on_attach,
                flags = lsp_flags,
            })
        end,

        ["sumneko_lua"] = function()
            lspconfig["sumneko_lua"].setup({
                on_attach = on_attach,
                flags = lsp_flags,

                settings = {
                    Lua = {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                        },
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = { "vim" },
                        },
                        workspace = {
                            -- Make the server aware of Neovim runtime files
                            library = vim.api.nvim_get_runtime_file("", true),
                            checkThirdParty = false,
                        },
                        -- Do not send telemetry data containing a randomized but unique identifier
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            })
        end,

        ["tsserver"] = function()
            require("typescript").setup({
                disable_commands = false, -- prevent the plugin from creating Vim commands
                debug = false, -- enable debug logging for commands
                go_to_source_definition = {
                    fallback = true, -- fall back to standard LSP definition on failure
                },
                server = { -- pass options to lspconfig's setup method
                    on_attach = on_attach,
                    flags = lsp_flags,
                },
            })
        end,

        ["omnisharp_mono"] = function()
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
        end,

        ["rust_analyzer"] = function()
            require("rust-tools").setup({
                tools = { -- rust-tools options

                    -- how to execute terminal commands
                    -- options right now: termopen / quickfix
                    executor = require("rust-tools.executors").termopen,

                    -- callback to execute once rust-analyzer is done initializing the workspace
                    -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
                    on_initialized = nil,

                    -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
                    reload_workspace_from_cargo_toml = true,

                    -- These apply to the default RustSetInlayHints command
                    inlay_hints = {
                        -- automatically set inlay hints (type hints)
                        -- default: true
                        auto = true,

                        -- Only show inlay hints for the current line
                        only_current_line = false,

                        -- whether to show parameter hints with the inlay hints or not
                        -- default: true
                        show_parameter_hints = true,

                        -- prefix for parameter hints
                        -- default: "<-"
                        parameter_hints_prefix = "<- ",

                        -- prefix for all the other hints (type, chaining)
                        -- default: "=>"
                        other_hints_prefix = "=> ",

                        -- whether to align to the length of the longest line in the file
                        max_len_align = false,

                        -- padding from the left if max_len_align is true
                        max_len_align_padding = 1,

                        -- whether to align to the extreme right or not
                        right_align = false,

                        -- padding from the right if right_align is true
                        right_align_padding = 7,

                        -- The color of the hints
                        highlight = "Comment",
                    },

                    -- options same as lsp hover / vim.lsp.util.open_floating_preview()
                    hover_actions = {

                        -- the border that is used for the hover window
                        -- see vim.api.nvim_open_win()
                        border = {
                            { "╭", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╮", "FloatBorder" },
                            { "│", "FloatBorder" },
                            { "╯", "FloatBorder" },
                            { "─", "FloatBorder" },
                            { "╰", "FloatBorder" },
                            { "│", "FloatBorder" },
                        },

                        -- Maximal width of the hover window. Nil means no max.
                        max_width = nil,

                        -- Maximal height of the hover window. Nil means no max.
                        max_height = nil,

                        -- whether the hover action window gets automatically focused
                        -- default: false
                        auto_focus = false,
                    },

                    -- settings for showing the crate graph based on graphviz and the dot
                    -- command
                    crate_graph = {
                        -- Backend used for displaying the graph
                        -- see: https://graphviz.org/docs/outputs/
                        -- default: x11
                        -- backend = "x11",
                        -- where to store the output, nil for no output stored (relative
                        -- path from pwd)
                        -- default: nil
                        output = nil,
                        -- true for all crates.io and external crates, false only the local
                        -- crates
                        -- default: true
                        full = true,

                        -- List of backends found on: https://graphviz.org/docs/outputs/
                        -- Is used for input validation and autocompletion
                        -- Last updated: 2021-08-26
                        enabled_graphviz_backends = {
                            "bmp",
                            "cgimage",
                            "canon",
                            "dot",
                            "gv",
                            "xdot",
                            "xdot1.2",
                            "xdot1.4",
                            "eps",
                            "exr",
                            "fig",
                            "gd",
                            "gd2",
                            "gif",
                            "gtk",
                            "ico",
                            "cmap",
                            "ismap",
                            "imap",
                            "cmapx",
                            "imap_np",
                            "cmapx_np",
                            "jpg",
                            "jpeg",
                            "jpe",
                            "jp2",
                            "json",
                            "json0",
                            "dot_json",
                            "xdot_json",
                            "pdf",
                            "pic",
                            "pct",
                            "pict",
                            "plain",
                            "plain-ext",
                            "png",
                            "pov",
                            "ps",
                            "ps2",
                            "psd",
                            "sgi",
                            "svg",
                            "svgz",
                            "tga",
                            "tiff",
                            "tif",
                            "tk",
                            "vml",
                            "vmlz",
                            "wbmp",
                            "webp",
                            "xlib",
                            "x11",
                        },
                    },
                },

                dap = {
                    adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
                },
                server = {
                    on_attach = on_attach,
                    flags = lsp_flags,
                    standalone = false,
                    settings = {
                        ["rust-analyzer"] = {
                            imports = {
                                granularity = {
                                    group = "module",
                                },
                                prefix = "self",
                            },
                            cargo = {
                                buildScripts = {
                                    enable = true,
                                },

                                autoReload = true,
                            },
                            procMacro = {
                                enable = true,
                            },
                        },
                    },
                },
            })
            require("rust-tools").inlay_hints.enable()
        end,
    })
end

return M
