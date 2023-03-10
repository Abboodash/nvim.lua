local status, indent_blankline = pcall(require, 'indent_blankline')
if (not status) then return end

vim.opt.list = true
vim.opt.listchars:append('space:⋅')

indent_blankline.setup({
	show_current_context = true,
	show_current_context_start = true,
	space_char_blankline = ' '
})
