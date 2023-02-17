local opt = vim.g
local set = vim.opt

-- Leader
opt.mapleader = " "

-- Font
set.guifont = { "FiraCode Regular", ":h16" }


set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true

set.wrap = false
set.swapfile = false
set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true

set.hlsearch = false
set.incsearch = true

set.scrolloff = 8

set.fileencoding = "utf-8"
set.termguicolors = true

set.number = true
set.relativenumber = true

set.showmode = false

set.cursorline = true
set.mouse = "a"

set.signcolumn = "yes"
set.splitbelow = true
set.splitright = true

set.hidden = true

set.smartindent = true

set.fillchars = {
	foldopen = "",
	foldclose = "",
	eob = " ",
}

vim.diagnostic.config({ virtual_text = true })

set.pumblend = 20 

if opt.neovide then
	opt.neovide_transparency = 0.86
end
