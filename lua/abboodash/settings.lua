vim.cmd('autocmd!')
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.guifont = {'FiraCode Regular', ':h16'}

vim.fileencoding = 'utf-8'

vim.opt.shell = 'fish'

vim.opt.path:append{'**'} -- Finding files - Search down into subfolders
vim.opt.wildignore:append{'*/node_modules/*'}

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.showmode = false

vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8

vim.opt.termguicolors = true

vim.opt.cursorline = true
vim.opt.mouse = 'a'

vim.opt.signcolumn = 'yes'
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.fillchars = {foldopen = '', foldclose = '', eob = ' '}

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave",
                            {pattern = '*', command = "set nopaste"})
