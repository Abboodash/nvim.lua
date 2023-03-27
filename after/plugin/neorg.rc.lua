local status, neorg = pcall(require, 'neorg')
if (not status) then return end

neorg.setup({})
