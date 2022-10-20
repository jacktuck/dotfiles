require('lualine').setup {
  options = {
    theme = "catppuccin",
    section_separators = '',
    component_separators = '',
    always_divide_middle = false,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
        {},
        {
            'filename',
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        },
    },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  }
}
