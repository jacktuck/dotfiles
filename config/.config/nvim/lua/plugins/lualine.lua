local hp_marks = require('harpoon.mark')

function Harpoon_files()
	local contents = {}

	for idx = 1, hp_marks.get_length() do
		local file_path = hp_marks.get_marked_file_name(idx)
		local file_name
		if file_path ~= "" then
			file_name = vim.fn.fnamemodify(file_path, ':t')
		end

		local current_file_path = vim.fn.expand("%:f")

		local prev = ""
		if idx ~= 1 then
			prev = " "
		end
		local next = ""
		if idx < hp_marks.get_length() then
			next = " "
		end

		if file_path == "" then
			contents[idx] = ""
		else
			if file_path == current_file_path then
				contents[idx] = string.format("%%#lualine_a_normal#%s%s %s%s", prev, idx, file_name, next)
			else
				contents[idx] = string.format("%%#lualine_a_inactive#%s%s %s%s", prev, idx, file_name, next)
			end
		end
	end

	return table.concat(contents)
end

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
			{ Harpoon_files }
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
				path = 1,       -- 0 = just filename, 1 = relative path, 2 = absolute path
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
				colored = true,       -- Displays diagnostics status in color if set to true.
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
