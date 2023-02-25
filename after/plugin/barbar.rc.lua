local status, barbar = pcall(require, "bufferline")
if (not status) then return end

barbar.setup({
    animation = true,
    closeable = true,
    icons = true,

    icon_separator_active = "",
    icon_separator_inactive = "",
    icon_close_tab = "",
    icon_close_tab_modified = "●",
    icon_pinned = "車",

    no_name_title = "[No Name]"
})

local opts = {silent = true, noremap = true}

local keymap = vim.keymap

keymap.set("n", "<A-,>", ":BufferPrevious<CR>", opts)
keymap.set("n", "<A-.>", ":BufferNext<CR>", opts)
keymap.set("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
keymap.set("n", "<A->>", ":BufferMoveNext<CR>", opts)
keymap.set("n", "<A-1>", ":BufferGoto 1<CR>", opts)
keymap.set("n", "<A-2>", ":BufferGoto 2<CR>", opts)
keymap.set("n", "<A-3>", ":BufferGoto 3<CR>", opts)
keymap.set("n", "<A-4>", ":BufferGoto 4<CR>", opts)
keymap.set("n", "<A-5>", ":BufferGoto 5<CR>", opts)
keymap.set("n", "<A-6>", ":BufferGoto 6<CR>", opts)
keymap.set("n", "<A-7>", ":BufferGoto 7<CR>", opts)
keymap.set("n", "<A-8>", ":BufferGoto 8<CR>", opts)
keymap.set("n", "<A-9>", ":BufferGoto 9<CR>", opts)
keymap.set("n", "<A-0>", ":BufferLast<CR>", opts)
keymap.set("n", "<A-c>", ":BufferClose<CR>", opts)
keymap.set("n", "<C-p>", ":BufferPick<CR>", opts)
