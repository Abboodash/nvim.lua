local M = {
	"numToStr/Comment.nvim",
}

function M.config()
	require("Comment").setup({
		padding = true,
		---Whether the cursor should stay at its position
		sticky = true,
		---Lines to be ignored while (un)comment
		ignore = nil,
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = "gctc",
			---Block-comment toggle keymap
			block = "gctb",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = "gcc",
			---Block-comment keymap
			block = "gcb",
		},
		---LHS of extra mappings
		extra = {
			---Add comment on the line above
			above = "gcO",
			---Add comment on the line below
			below = "gco",
			---Add comment at the end of line
			eol = "gcA",
		},
		---Enable keybindings
		---NOTE: If given `false` then the plugin won't create any mappings
		mappings = {
			---Operator-pending mapping; `gcc` `gcb` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
		---Function to call before (un)comment
		pre_hook = nil,
		---Function to call after (un)comment
		post_hook = nil,
	})
end

return M
