-- local status, undotree = pcall(require, "undotree")
-- if (not status) then return end
-- TODO: add check for this
local g = vim.g

g.undotree_WindowLayout = 3
g.undotree_SplitWidth = 40
g.undotree_DiffpanelHeight = 10

local status2, wk = pcall(require, 'which-key')
if (not status2) then return end

wk.register({
    t = {
        name = 'Undotree',
        t = { '<cmd>UndotreeToggle<cr>', 'Toggle' },
        s = { '<cmd>UndotreeShow<cr>', 'Show' },
        h = { '<cmd>UndotreeHide<cr>', 'Hide' },
        f = { '<cmd>UndotreeFocus<cr>', 'Focus' }
    }
}, { prefix = '<leader>' })
