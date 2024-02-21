local hp_marks = require("harpoon.mark")

function Harpoon_files()
  local contents = {}

  for idx = 1, hp_marks.get_length() do
    local file_path = hp_marks.get_marked_file_name(idx)
    local file_name
    if file_path ~= "" then
      file_name = vim.fn.fnamemodify(file_path, ":t")
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

    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")

      if vim.api.nvim_buf_get_option(buf, "modified") then
        if buf_name == file_path then
          file_name = file_name .. "*"
        end
      end
    end

    if file_path == "" then
      contents[idx] = ""
    else
      if file_path == current_file_path then
        contents[idx] = string.format("%%#lualine_c_normal#%s%s %s%s", prev, idx, file_name, next)
      else
        contents[idx] = string.format("%%#lualine_b_inactive#%s%s %s%s", prev, idx, file_name, next)
      end
    end
  end

  return table.concat(contents)
end

require("lualine").setup({
  options = {
    theme = "auto",
    section_separators = "",
    component_separators = "",
    always_divide_middle = true,
  },
  tabline = {
    lualine_a = {
      { Harpoon_files },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
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
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
    },
    lualine_y = {
      "diff",
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = "", warn = "󰈻" },
        colored = true, -- Displays diagnostics status in color if set to true.
        update_in_insert = false, -- Update diagnostics in insert mode.
        always_visible = false, -- Show diagnostics even if there are none.
      },
      "filetype",
      "progress",
      "location",
      "branch",
    },
    lualine_z = {
      -- "location"
    },
  },
})
