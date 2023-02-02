local M = {
	"ziontee113/icon-picker.nvim",
	dependencies = {
		"stevearc/dressing.nvim",
	},
}

function M.config()
	require("icon-picker").setup({
		disable_legacy_commands = true,
	})
end

return M
