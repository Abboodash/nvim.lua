local M = {
    "gelguy/wilder.nvim",

    dependencies = {
        "romgrk/fzy-lua-native",
        "nvim-tree/nvim-web-devicons",
    },
}

function M.config()
    local wilder = require("wilder")

    wilder.setup({ modes = { ":", "/", "?" } })

    wilder.set_option("pipeline", {
        wilder.branch(
            wilder.cmdline_pipeline({
                fuzzy = 1,
                fuzzy_filter = wilder.lua_fzy_filter(),
            }),
            wilder.vim_search_pipeline()
        ),
    })

    wilder.set_option(
        "renderer",
        wilder.renderer_mux({
            [":"] = wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
                highlighter = {
                    wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
                },
                highlights = {
                    border = "Normal",
                    accent = wilder.make_hl(
                        "WilderAccent",
                        "Pmenu",
                        { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
                    ),
                },

                border = "rounded",
                max_height = "50%",
                pumblend = 20,
                min_height = 0, -- set to the same as 'max_height' for a fixed height window
                prompt_position = "top", -- 'top' or 'bottom' to set the location of the prompt
                reverse = 0,
                left = { " ", wilder.popupmenu_devicons() },
                right = { " ", wilder.popupmenu_scrollbar() }, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
            })),

            ["/"] = wilder.wildmenu_renderer({
                pumblend = 40,
                highlighter = {
                    wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
                },
                highlights = {
                    accent = wilder.make_hl(
                        "WilderAccent",
                        "Pmenu",
                        { { a = 1 }, { a = 1 }, { foreground = "#f4468f" } }
                    ),
                },
            }),
        })
    )
end

return M
