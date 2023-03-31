return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-file-browser.nvim' },
            { 'nvim-tree/nvim-web-devicons' },
            {
                'jvgrootveld/telescope-zoxide',
                dependencies = { { 'nvim-lua/popup.nvim' } }
            },
            { 'nvim-telescope/telescope-ghq.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            {
                'dhruvmanila/telescope-bookmarks.nvim'
                -- Uncomment if the selected browser is Firefox, Waterfox or buku
                -- requires = {
                --   'kkharji/sqlite.lua',
                -- }
            }
        }
    },
    { 'folke/which-key.nvim' },
    { 'EdenEast/nightfox.nvim' },
    { 'Shatur/neovim-ayu' },
    { 'windwp/nvim-autopairs' },
    { 'tpope/vim-fugitive', dependencies = { { 'tpope/vim-rhubarb' } } },
    { 'lewis6991/gitsigns.nvim' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            { 'williamboman/mason.nvim' }, -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional
            -- Dap Support
            { 'mfussenegger/nvim-dap' }, -- Required
            { 'jay-babu/mason-nvim-dap.nvim' }, -- Optional
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'onsails/lspkind.nvim' }, -- Required
            { 'hrsh7th/cmp-buffer' }, -- Optional
            { 'hrsh7th/cmp-path' }, -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' }, -- Optional
            -- Parsing
            { 'jose-elias-alvarez/null-ls.nvim' }, -- Required
            { 'jose-elias-alvarez/typescript.nvim' }, -- Optional
            { 'jay-babu/mason-null-ls.nvim' }, -- Optional
            -- Snippets
            { 'L3MON4D3/LuaSnip' }, -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
            -- Winbar
            {
                'utilyre/barbecue.nvim',
                name = 'barbecue',
                version = '*',
                dependencies = {
                    'SmiteshP/nvim-navic',
                    'nvim-tree/nvim-web-devicons' -- optional dependency
                }
            }
        }
    },
    { 'rcarriga/nvim-notify' },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { { 'nvim-treesitter/playground' } },
        build = ':TSUpdate'
    },
    { 'stevearc/dressing.nvim' },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { { 'nvim-tree/nvim-web-devicons' } }
    },
    {
        'nvim-neorg/neorg',
        build = ':Neorg sync-parsers',
        opts = {
            load = {
                ['core.defaults'] = {}, -- Loads default behaviour
                ['core.norg.concealer'] = {}, -- Adds pretty icons to your documents
                ['core.norg.dirman'] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = { main = '~/notes' },
                        default_workspace = 'main'
                    }
                }
            }
        },
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    { 'dstein64/vim-startuptime' },
    { 'mbbill/undotree' },
    { 'ThePrimeagen/harpoon', dependencies = { { 'nvim-lua/plenary.nvim' } } },
    { 'norcalli/nvim-colorizer.lua' },
    { 'numToStr/Comment.nvim' },
    { 'ziontee113/icon-picker.nvim' },
    { 'phaazon/hop.nvim' },
    { 'vuki656/package-info.nvim', dependencies = { { 'MunifTanjim/nui.nvim' } } },
    { 'j-hui/fidget.nvim' },
    { 'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async' },
    { 'folke/trouble.nvim', dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'iamcco/markdown-preview.nvim', build = 'cd app && yarn install' },
    { 'mvllow/modes.nvim', tag = 'v0.2.0' },
    { 'gelguy/wilder.nvim' },
    { 'junegunn/goyo.vim' },

    { 'romgrk/fzy-lua-native', build = 'make' },
    { 'nixprime/cpsm', build = 'bash install.sh' }
}
