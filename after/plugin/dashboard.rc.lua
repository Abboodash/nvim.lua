local status, dashboard = pcall(require, "dashboard")
if (not status) then return end

-- TODO: Make a better config for this

dashboard.setup({
    theme = 'hyper',
    config = {
        week_header = {enable = true},
        shortcut = {
            {
                desc = ' Update',
                group = '@property',
                action = 'Lazy update',
                key = 'u'
            }, {
                icon = ' ',
                icon_hl = '@variable',
                desc = 'Files',
                group = 'Label',
                action = 'Telescope find_files',
                key = 'f'
            }, {
                desc = ' Apps',
                group = 'DiagnosticHint',
                action = 'Telescope app',
                key = 'a'
            }, {
                desc = "📦 Config",
                group = "Number",
                action = "Telescope nvim_config",
                key = "c"
            },
            {
                desc = '  dotfiles',
                group = '',
                action = 'Telescope dotfiles',
                key = 'd'
            }
        }
    }
})
