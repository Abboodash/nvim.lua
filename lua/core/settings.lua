local opt = vim.g
local set = vim.opt

opt.mapleader = " "

vim.opt.guifont = { "FiraCode Regular", ":h16" }

set.expandtab = true
set.smarttab = true
set.shiftwidth = 4
set.tabstop = 4

set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = "utf-8"
set.termguicolors = true

set.number = true
set.numberwidth = 2

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
