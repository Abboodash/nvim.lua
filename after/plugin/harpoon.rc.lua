local status, harpoon = pcall(require, "harpoon")
if (not status) then return end

harpoon.setup({
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = {"harpoon"},

        -- set marks specific to each git branch inside git repository
        mark_branch = false
    }
})

local status2, wk = pcall(require, "which-key")
if (not status2) then return end

wk.register({
    e = {
        name = "Harpoon",
        a = {require("harpoon.mark").add_file, "Add File"},
        m = {require("harpoon.ui").toggle_quick_menu, "Quick Menu"},
        n = {require("harpoon.mark").nav_next, "Navigate Next"},
        p = {require("harpoon.mark").nav_prev, "Navigate Previous"}
    }
}, {prefix = "<leader>"})
