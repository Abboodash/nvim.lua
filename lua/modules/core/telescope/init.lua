local M = {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "kdheepak/lazygit.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "cljoly/telescope-repo.nvim", 
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        { "dhruvmanila/telescope-bookmarks.nvim" },

        "nvim-lua/popup.nvim",
        "jvgrootveld/telescope-zoxide",
    },
}

function M.config()
    local telescope = require("telescope")
    local z_utils = require("telescope._extensions.zoxide.utils")

    telescope.setup({
        extensions = {
            fzf = {
                fuzzy = true,                    -- false will only do exact matching
                override_generic_sorter = true,  -- override the generic sorter
                override_file_sorter = true,     -- override the file sorter
                case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
            },                                   -- the default case_mode is "smart_case"
        },

        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    -- your custom insert mode mappings
                },
                ["n"] = {
                -- your custom normal mode mappings
                },
            },
        },

        bookmarks = {
            selected_browser = "brave",
        },

        zoxide = {
            prompt_title = "[ Walking on my shoulders ]",
            mappings = {
                default = {
                    after_action = function(selection)
                        print("Update to (" .. selection.z_score .. ") " .. selection.path)
                    end
                },
                ["<C-s>"] = {
                    before_action = function(selection) print("before C-s") end,
                    action = function(selection)
                        vim.cmd.edit(selection.path)
                    end
                },
                -- Opens the selected entry in a new split
                ["<C-q>"] = { action = z_utils.create_basic_command("split") },
            },
        },
    })

    telescope.load_extension("file_browser")
    telescope.load_extension("lazygit")
    telescope.load_extension("live_grep_args")
    telescope.load_extension("repo")
    telescope.load_extension("fzf")
    telescope.load_extension("bookmarks")
    telescope.load_extension("zoxide")

end

return M
