local M = {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "nvim-tree/nvim-web-devicons", lazy = true },
    },
}

function M.config()
    require("lualine").setup({
        options = {
            theme = "auto",

            enable = { statusline = 1, tabline = 0 },
        },
    })
end

return M
