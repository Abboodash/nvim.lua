local M = {
    "numToStr/Navigator.nvim",
    keys = {
        { "<leader><Right>", vim.cmd.NavigatorRight, desc = "Navigate Right"},
        { "<leader><Left>", vim.cmd.NavigatorLeft, desc = "Navigate Left"},
        { "<leader><Down>", vim.cmd.NavigatorDown, desc = "Navigate Down"},
        { "<leader><Up>", vim.cmd.NavigatorUp, desc = "Navigate Up" },
        {"<leader><bs>", vim.cmd.NavigatorPrvious, desc = "Navigat Previous"}
    },
}

function M.config()
    require("Navigator").setup()
end

return M
