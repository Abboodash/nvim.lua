local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local z_utils = require('telescope._extensions.zoxide.utils')

local find_files_settings = {
	hidden = true,
	file_ignore_patterns = {
		'node_modules/', 'build/', 'dist/', 'yarn.lock', '.git/', '.env', '%.meta',
  '.yarn/'
	}
}

telescope.setup({
	defaults = {file_ignore_patterns = {'%.meta'}},
	pickers = {fd = find_files_settings, find_files = find_files_settings},
	extensions = {
		file_browser = {
			hidden = true,
			theme = 'ivy',
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			mappings = {
				['i'] = {
					-- your custom insert mode mappings
				},
				['n'] = {
					-- your custom normal mode mappings
				}
			}
		},
		zoxide = {
			prompt_title = '[ Work Work ]',
			mappings = {
				default = {
					after_action = function(selection)
						print('Update to (' .. selection.z_score .. ') ' .. selection.path)
					end
				},
				['<C-s>'] = {
					before_action = function(selection) print('before C-s') end,
					action = function(selection) vim.cmd.edit(selection.path) end
				},
				-- Opens the selected entry in a new split
				['<C-q>'] = {action = z_utils.create_basic_command('split')}
			}
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = 'smart_case' -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		bookmarks = {selected_browser = 'brave', url_open_command = 'brave'}
	}
})

telescope.load_extension('file_browser')
telescope.load_extension('zoxide')
telescope.load_extension('ghq')
telescope.load_extension('fzf')
telescope.load_extension('bookmarks')

local status2, wk = pcall(require, 'which-key')
if (not status2) then return end

wk.register({
	f = {
		name = 'Telescope',
		f = {'<cmd>Telescope find_files<cr>', 'Find Files'},
		g = {'<cmd>Telescope live_grep<cr>', 'Live Grep'},
		b = {'<cmd>Telescope file_browser<cr>', 'File Browser'},
		p = {
			'<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>',
   'File Browser'
		},
		z = {'<cmd>Telescope zoxide list<cr>', 'Change dir'},
		q = {'<cmd>Telescope ghq list<cr>', 'Ghq list'},
		m = {
			function()
				require('telescope').extensions.bookmarks.bookmarks(require(
								                                                    'telescope.themes').get_dropdown {
					layout_config = {width = 0.8, height = 0.8},
					previewer = false
				})
			end, 'Bookmarks'
		}
	}
}, {prefix = '<leader>'})

if (pcall(require, 'harpoon')) then
	telescope.load_extension('harpoon')
	wk.register({f = {h = {'<cmd>Telescope harpoon marks<cr>', 'Harpoon marks'}}},
	            {prefix = '<leader>'})
end
