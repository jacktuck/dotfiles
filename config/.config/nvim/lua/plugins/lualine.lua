require('lualine').setup {

	options = {
		theme = "dracula",
		section_separators = '',
		component_separators = '',
		always_divide_middle = true,
		globalstatus = true,
	},
	tabline = {
		lualine_a = {
			{
				'buffers',
				icons_enabled = false,
				symbols = {
					modified = '*', -- Text to show when the buffer is modified
					alternate_file = '', -- Text to show to identify the alternate file
					directory = '', -- Text to show when the buffer is a directory
				},
			}

		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {}
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"filename",
				file_status = true, -- displays file status (readonly status, modified status)
				path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				'diagnostics',
				sources = { 'nvim_diagnostic' },
				sections = { 'error', 'warn' },
				symbols = { error = '', warn = '󰈻' },
				colored = true, -- Displays diagnostics status in color if set to true.
				update_in_insert = false, -- Update diagnostics in insert mode.
				always_visible = false, -- Show diagnostics even if there are none.
			},
			-- "filetype",
			-- "progress",
			'branch',
			'diff',
		},
		lualine_z = {
			-- "location"
		},
	}
}