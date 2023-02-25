local status, icon_picker = pcall(require, 'icon-picker')
if (not status) then return end

icon_picker.setup({disable_legacy_commands = true})

local status2, wk = pcall(require, 'which-key')
if (not status2) then return end

wk.register({
	i = {
		name = 'Icon picker',
		y = {'<cmd>IconPickerYank<cr>', 'Yank'},
		i = {'<cmd>IconPickerInsert<cr>', 'Insert'},
		n = {'<cmd>IconPickerNormal<cr>', 'Normal'}
	}
}, {prefix = '<leader>'})
