local M = {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    opts = {
        load = {
            ["core.defaults"] = {}, -- Loads default behaviour
            ["core.norg.concealer"] = {}, -- Adds pretty icons to your documents
            ["core.norg.dirman"] = { -- Manages Neorg workspaces
                config = {
                    workspaces = {
                        notes = "~/notes",
                    },
                    default_workspace = "notes",
                },
            },
            ["core.integrations.telescope"] = {},            
        },
    },
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-neorg/neorg-telescope" },
    },
}

return M
