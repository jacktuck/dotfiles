require('lualine').setup {
  options = {
    theme = "catppuccin",
    section_separators = '',
    component_separators = '',
    always_divide_middle = false,
    globalstatus = true,
  },
  winbar = {
    lualine_c = {
      { "aerial", sep =  " › "},
    }
  },
  sections = {
    lualine_a = {"mode"},
    lualine_b = {
        {
            "filename",
            file_status = true, -- displays file status (readonly status, modified status)
            path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
        }
    },
    lualine_c = {},
    lualine_x = {"lsp_progress"},
    lualine_y = {
      "diagnostics",
      "filetype",
      "fileformat",
      "progress",
    },
    lualine_z = {"location"},
  }
}
