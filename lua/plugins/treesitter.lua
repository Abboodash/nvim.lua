local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
        "mrjones2014/nvim-ts-rainbow",
    },
}

function M.config()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "c",
            "lua",
            "rust",
            "python",
            "typescript",
            "c_sharp",
            "html",
        },

        sync_install = false,
        auto_install = true,

        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },

        refactor = {
            highlight_definitions = { enable = true },
            smart_rename = {
                enable = true,
                keymaps = {
                    smart_rename = "<F2>",
                },
            },
            navigation = {
                enable = true,
                keymaps = {
                    goto_definition = "gnd",
                    list_definitions = "gnD",
                    list_definitions_toc = "gO",
                    goto_next_usage = "<A-*>",
                    goto_previous_usage = "<A-#>",
                },
            },
        },

        rainbow = {
            enable = true,
        },
    })
end

return M
