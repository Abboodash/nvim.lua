local wk = require("which-key")

local package_info = require("package-info")

wk.register({
    t = {
        name = "tree",
        t = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
        o = { "<cmd>NvimTreeOpen<cr>", "Open" },
        c = { "<cmd>NvimTreeClose<cr>", "Close" },
    },
    f = {
        name = "telescope",
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
        n = { "<cmd>Telescope neoclip<cr>", "Neoclip" },
        l = { "<cmd>Telescope lazygit<cr>", "Lazygit" },
        g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
        t = { "<cmd>Telescope notify<cr>", "Notify" },
        d = { "<cmd>TodoTelescope<cr>", "Todo" },
        r = { "<cmd>Telescope repo<cr>", "Repos" },
        m = { "<cmd>Telescope bookmarks<cr>", "Browser Bookmarks" },
    },
    m = {
        name = "mason",
        m = { "<cmd>Mason<cr>", "Mason" },
        l = { "<cmd>MasonLog<cr>", "Log" },
    },
    n = {
        name = "terminal",
        b = { "<cmd>lua _BTOP_TERMINAL_TOGGLE()<cr>", "btop" },
    },
    x = {
        name = "trouble",
        x = { "<cmd>TroubleToggle<cr>", "Toggle" },
        q = { "<cmd>Trouble quickfix<cr>", "Quickfix" },
        d = { "<cmd>TodoTrouble<cr>", "Todo" },
    },
    p = {
        name = "package manager",
        n = {
            name = "node",
            s = { package_info.show, "Show" },
            h = { package_info.hide, "Hide" },
            t = { package_info.toggle, "Toggle" },
            i = { package_info.install, "Install" },
            u = { package_info.update, "Update" },
            d = { package_info.delete, "Delete" },
            c = { package_info.change_version, "Change Version" },
        },
        b = {
            name = "baufferline",
            b = { "<cmd>BufferOrderByBufferNumber<cr>", "Order by number" },
            d = { "<cmd>BufferOrderByDirectory<cr>", "Order by directory" },
            l = { "<cmd>BufferOrderByLanguage<cr>", "Order by language" },
        },
    },
    h = {
        name = "harpoon",
        a = { require("harpoon.mark").add_file, "Add file" },
        r = { require("harpoon.mark").rm_file, "Remove file" },
        m = { require("harpoon.ui").toggle_quick_menu, "Toggle quick menu"},
        n = {
            name = "navigate",
            n = { require("harpoon.ui").nav_next, "Next" },
            p = { require("harpoon.ui").nav_prev, "Previous" },
        },
    },
    l = {
        name = "lazy",
        l = { "<cmd>Lazy home<cr>", "Home" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        i = { "<cmd>Lazy install<cr>", "Install" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        c = { "<cmd>Lazy clean<cr>", "Clean"},
        h = { "<cmd>Lazy help<cr>", "Help" },
    },
 }, { prefix = "<leader>" })

local opts = { noremap = true, silent = true }

local map = vim.api.nvim_set_keymap

-- navigator
map("n", "<leader><Up>", "<cmd>NavigatorUp<cr>", opts)
map("n", "<leader><Down>", "<cmd>NavigatorDown<cr>", opts)
map("n", "<leader><Right>", "<cmd>NavigatorRight<cr>", opts)
map("n", "<leader><Left>", "<cmd>NavigatorLeft<cr>", opts)
map("n", "<leader><bs>", "<cmd>NavigatorPrevious<cr>", opts)

-- barbar
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", ":BufferMoveNext<CR>", opts)
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)
map("n", "<A-c>", ":BufferClose<CR>", opts)
map("n", "<C-p>", ":BufferPick<CR>", opts)

-- nvim
map("n", "<C-s>", "<cmd>w<cr>", opts)
map("n", "<A-k>", "<cmd>m .-2<cr>", opts)
map("n", "<A-j>", "<cmd>m .+1<cr>", opts)
