local wk = require("which-key")

local package_info = require("package-info")
local dapui = require("dapui")

local keybinds = {
   l = {
        name = "lazy",
        l = { "<cmd>Lazy home<cr>", "Home" },
        s = { "<cmd>Lazy sync<cr>", "Sync" },
        i = { "<cmd>Lazy install<cr>", "Install" },
        u = { "<cmd>Lazy update<cr>", "Update" },
        c = { "<cmd>Lazy clean<cr>", "Clean"},
        h = { "<cmd>Lazy help<cr>", "Help" },
    },
    f = {
        name = "telescope",
        f = { "<cmd>Telescope find_files<cr>", "Find Files" },
        b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
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
    i = {
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
    u = {
        name = "undotree",
        t = { vim.cmd.UndotreeToggle, "Toggle" },
        s = { vim.cmd.UndotreeShow, "Show" },
        h = { vim.cmd.UndotreeHide, "Hide" },
        f = { vim.cmd.UndotreeFocus, "Focus" },
    },
    d = {
        name = "dap",
        u = {
            name = "ui",
            t = { dapui.toggle, "Toggle" },
            o = { dapui.open, "Open" },
            c = { dapui.close, "Close" },
        },
    },
}

local opts = { noremap = true, silent = true }

wk.register(keybinds, { prefix = "<leader>" })

-- barbar
vim.keymap.set("n", "<A-,>", ":BufferPrevious<CR>", opts)
vim.keymap.set("n", "<A-.>", ":BufferNext<CR>", opts)
vim.keymap.set("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
vim.keymap.set("n", "<A->>", ":BufferMoveNext<CR>", opts)
vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", opts)
vim.keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", opts)
vim.keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", opts)
vim.keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", opts)
vim.keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", opts)
vim.keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", opts)
vim.keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", opts)
vim.keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", opts)
vim.keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", opts)
vim.keymap.set("n", "<A-0>", ":BufferLast<CR>", opts)
vim.keymap.set("n", "<A-c>", ":BufferClose<CR>", opts)
vim.keymap.set("n", "<C-p>", ":BufferPick<CR>", opts)

-- nvim
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
