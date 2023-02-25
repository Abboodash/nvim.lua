local keymap = vim.keymap

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- FIX: root permission save
-- Save with root permission (not working for now)
vim.api.nvim_create_user_command('W', 'w !sudo tee >/dev/null %:p:S', {})

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move to window
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', 'swh', '<C-w><')
keymap.set('n', 'swl', '<C-w>>')
keymap.set('n', 'swk', '<C-w>+')
keymap.set('n', 'swj', '<C-w>-')

-- Move lines
keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

local status, wk = pcall(require, 'which-key')
if (not status) then return end

wk.register({
    L = {
        name = 'Lazy',
        l = { '<cmd>Lazy home<cr>', 'Home' },
        s = { '<cmd>Lazy sync<cr>', 'Sync' },
        i = { '<cmd>Lazy install<cr>', 'Install' },
        u = { '<cmd>Lazy update<cr>', 'Update' },
        c = { '<cmd>Lazy check<cr>', 'Check' },
        x = { '<cmd>Lazy clean<cr>', 'Clean' },
        h = { '<cmd>Lazy health<cr>', 'Health' }
    },
    u = { name = 'Utils', h = { '<cmd>nohlsearch<cr>', 'Clear search' } }
}, { prefix = '<leader>' })
