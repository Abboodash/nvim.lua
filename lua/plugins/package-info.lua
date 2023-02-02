local M = {
	"vuki656/package-info.nvim",

	dependencies = {
		"MunifTanjim/nui.nvim",
	},
}

function M.config()
	require("package-info").setup({
		colors = {
			up_to_date = "#3C4048", -- Text color for up to date dependency virtual text
			outdated = "#d19a66", -- Text color for outdated dependency virtual text
		},
		icons = {
			enable = true, -- Whether to display icons
			style = {
				up_to_date = "|  ", -- Icon for up to date dependencies
				outdated = "|  ", -- Icon for outdated dependencies
			},
		},
		autostart = true, -- Whether to autostart when `package.json` is opened
		hide_up_to_date = false, -- It hides up to date versions when displaying virtual text
		hide_unstable_versions = false, -- It hides unstable versions from version list e.g next-11.1.3-canary3

		package_manager = "yarn", -- If not provided it will automatically use yarn
	})
end

return M
