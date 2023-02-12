local M = {
    "phaazon/hop.nvim",
    branch = "v2",
    lazy = true,
    keys = {
        { "ss", "<cmd>HopWord<cr>", desc = "Hop a word" },
        { "sl", "<cmd>HopLine<cr>", desc = "Hop a line" },
    },
}

function M.config()
    require("hop").setup()
end

return M
