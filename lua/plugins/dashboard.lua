local M = {
    "glepnir/dashboard-nvim",
    event = "VimEnter",
}

function M.config()
    local db = require("dashboard")

    local custom_header = {
        "",
        "",
        "",
        "",
        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
        "",
        "",
        "",
    }

    db.setup({
        theme = "hyper",

        config = {
            header = custom_header,
            shortcut = {
                { desc = "ﮮ Update", group = "packages_group", key = "u", action = "Lazy update" },
                { desc = " Files", group = "files_group", key = "f", action = "Telescope find_files" },
                {
                    desc = " dotfiles",
                    group = "files_group",
                    key = "d",
                    action = "cd ~/.dotfiles/ | e README.md",
                },
                { desc = "➡ Exit", group = "neovim_group", key = "q", action = "quit" },
            },
            packages = { enable = true }, -- show how many plugins neovim loaded
            project = { limit = 8, action = "Telescope find_files cwd=" }, -- limit how many projects list, action when you press key or enter it will run this action.
            mru = { limit = 10 }, -- how many files in list
            footer = {},
        },
    })
end

return M
