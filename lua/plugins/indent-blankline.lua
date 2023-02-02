local M = {
	"lukas-reineke/indent-blankline.nvim",
}

function M.config()
	vim.opt.list = true
	vim.opt.listchars:append("space:⋅")

	require("indent_blankline").setup({
		show_current_context = true,
		show_current_context_start = true,
		space_char_blankline = " ",
	})
end

return M
