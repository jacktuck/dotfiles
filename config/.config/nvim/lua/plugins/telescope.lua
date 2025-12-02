return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "prochri/telescope-all-recent.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "kkharji/sqlite.lua",
    "ThePrimeagen/harpoon",
  },
  opts = function()
    local disable_devicons = false
    return {
      disable_devicons = disable_devicons,
      defaults = require("telescope.themes").get_ivy({
        path_display = { "truncate" },
        file_ignore_patterns = { "%.git/" },
        preview = { treesitter = false },
        layout_config = { height = 100 },
      }),
      extensions = {
        file_browser = {
          preview = { ls_short = true },
          hidden = { file_browser = true, folder_browser = false },
          respect_gitignore = false,
          depth = 1,
          display_stat = false,
          disable_devicons = disable_devicons,
        },
      },
      pickers = {
        find_files = {
          path_display = function(_, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s - %s", tail, path)
          end,
          find_command = { "fd", "--type", "file", "--hidden" },
          disable_devicons = disable_devicons,
        },
        live_grep = {
          only_sort_text = true,
          additional_args = function(_) return { "--hidden" } end,
          disable_devicons = disable_devicons,
        },
        grep_string = {
          only_sort_text = true,
          additional_args = function(_) return { "--hidden" } end,
          disable_devicons = disable_devicons,
        },
        buffers = {
          path_display = function(_, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s - %s", tail, path)
          end,
          mappings = { i = { ["<C-d>"] = require("telescope.actions").delete_buffer } },
          disable_devicons = disable_devicons,
        },
      },
    }
  end,
  config = function(_, opts)
    require("telescope-all-recent").setup({})
    local telescope = require("telescope")
    telescope.setup({
      defaults = opts.defaults,
      extensions = opts.extensions,
      pickers = opts.pickers,
    })
    telescope.load_extension("file_browser")
    telescope.load_extension("harpoon")
  end,
}
