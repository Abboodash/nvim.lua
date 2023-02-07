local M = {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.1",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        "kdheepak/lazygit.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
}

function M.config()
    local telescope = require("telescope")

    telescope.setup()

    telescope.load_extension("file_browser")
    telescope.load_extension("lazygit")
    telescope.load_extension("live_grep_args")
end

return M
