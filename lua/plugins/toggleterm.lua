local M = {
	"akinsho/toggleterm.nvim",
}

function M.config()
	require("toggleterm").setup({
		open_mapping = [[<c-`>]],

		size = 20,
		direction = "horizontal",

		hide_numbers = true,

		start_in_insert = true,

		close_on_exit = true,

		float_opts = {
			border = "curved",
			width = 160,
			hight = 80,
			winblend = 3,
		},
	})

	local Terminal = require("toggleterm.terminal").Terminal

	local htop = Terminal:new({ cmd = "htop", direction = "float", size = 180, hidden = true })

	function _HTOP_TERMINAL_TOGGLE()
		htop:toggle()
	end

	local map = vim.api.nvim_set_keymap

	function _G.set_terminal_keymaps()
		local termotps = { noremap = true, silent = true, buffer = 0 }
		map("t", "<esc>", [[<c-\><c-n>]], termotps)
		map("t", "jk", [[<c-\><c-n>]], termotps)
		map("t", "<c-h>", [[<cmd>wincmd h<cr>]], termotps)
		map("t", "<c-j>", [[<cmd>wincmd j<cr>]], termotps)
		map("t", "<c-k>", [[<cmd>wincmd k<cr>]], termotps)
		map("t", "<c-l>", [[<cmd>wincmd l<cr>]], termotps)
	end
end

return M
