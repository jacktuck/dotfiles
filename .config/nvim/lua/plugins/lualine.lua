return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = { "ThePrimeagen/harpoon", "folke/noice.nvim" },
  opts = function()
    local ok_hp, hp_marks = pcall(require, "harpoon.mark")
    local function Harpoon_files()
      if not ok_hp then return "" end
      local contents = {}
      local current_file_path = vim.fn.expand("%:f")
      for idx = 1, hp_marks.get_length() do
        local file_path = hp_marks.get_marked_file_name(idx)
        local file_name
        if file_path ~= "" then
          local parent = vim.fn.fnamemodify(file_path, ":h:t")
          local fname = vim.fn.fnamemodify(file_path, ":t")
          file_name = parent .. "/" .. fname
        end
        local prev = idx ~= 1 and " " or ""
        local next = idx < hp_marks.get_length() and " " or ""
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
          local buf_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":.")
            if vim.api.nvim_buf_get_option(buf, "modified") and buf_name == file_path then
              file_name = (file_name or "") .. "*"
            end
        end
        if file_path == "" then
          contents[idx] = ""
        elseif file_path == current_file_path then
          contents[idx] = string.format("%%#lualine_c_normal#%s%s %s%s", prev, idx, file_name, next)
        else
          contents[idx] = string.format("%%#lualine_b_inactive#%s%s %s%s", prev, idx, file_name, next)
        end
      end
      return table.concat(contents)
    end
    return {
      options = {
        theme = "seoul256",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        always_divide_middle = true,
      },
      tabline = {
        lualine_a = { { "filename", file_status = true, path = 0 } },
        lualine_b = {},
        lualine_c = { function() return vim.fn.expand("%:h") end },
        lualine_x = { "branch" },
        lualine_y = {},
        lualine_z = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { Harpoon_files },
        lualine_x = {
          {
            function()
              local ok, noice_api = pcall(require, "noice")
              return ok and noice_api.api.statusline.mode.get() or ""
            end,
            cond = function()
              local ok, noice_api = pcall(require, "noice")
              return ok and noice_api.api.statusline.mode.has()
            end,
            color = { fg = "#ff9e64" },
          },
          { "diff", colored = false },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            sections = { "error", "warn" },
            symbols = { error = "", warn = "󰈻" },
            colored = true,
            update_in_insert = false,
            always_visible = false,
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
    }
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
