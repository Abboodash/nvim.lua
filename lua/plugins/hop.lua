local M = {
    "phaazon/hop.nvim",
    branch = "v2",
    lazy = true,
    keys = {
        { "s", "<cmd>HopWord<cr>", desc = "Hop a word" },
        { "l", "<cmd>HopLine<cr>", desc = "Hop a line" },
    },
}

function M.config()
    require("hop").setup()
end

return M
