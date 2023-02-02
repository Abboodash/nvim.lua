local M = {
    "rcarriga/nvim-notify",
}

function M.config()
    require("notify").setup({
        background_colour = "#000000"
    })

    vim.notify = require("notify")

    require("telescope").load_extension("notify")
end

return M
