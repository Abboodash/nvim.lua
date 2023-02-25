local status, cmp = pcall(require, "cmp")
if (not status) then return end
local status2, lspkind = pcall(require, "lspkind")
if (not status2) then return end

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = false,
    suggest_lsp_servers = false,
})


local cmp_config = lsp.defaults.cmp_config({
    window = {
        completion = cmp.config.window.bordered()
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                vim_item.menu = entry:get_completion_item().detail
                return vim_item
            end,
        }),
    },
})

cmp.setup(cmp_config)
