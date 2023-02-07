local M = {
    "m4xshen/autoclose.nvim",
}

function M.config()
    require("autoclose").setup({
        keys = {
            ["("] = { escape = true, close = true, pair = "()" },
            ["["] = { escape = true, close = true, pair = "[]" },
            ["{"] = { escape = true, close = true, pair = "{}" },

            [">"] = { escape = true, close = false, pair = "<>" },
            [")"] = { escape = true, close = false, pair = "()" },
            ["]"] = { escape = true, close = false, pair = "[]" },
            ["}"] = { escape = true, close = false, pair = "{}" },

            ["'"] = { escape = true, close = true, pair = "''" },
            ["`"] = { escape = true, close = true, pair = "``" },
        },
        options = {
            disabled_filetypes = { "text", "markdown" },
        },
    })
end

return M
