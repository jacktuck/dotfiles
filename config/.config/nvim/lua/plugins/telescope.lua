local builtin = require("telescope.builtin")

require("telescope-all-recent").setup({})

require("telescope").setup({
  defaults = require("telescope.themes").get_ivy({
    path_display = { "truncate" },
    file_ignore_patterns = { ".git/" },
    preview = {
      treesitter = false,
    },
    layout_config = {
      height = 100,
    },
  }),
  extensions = {
    file_browser = {
      preview = {
        ls_short = true,
      },
      hidden = { file_browser = true, folder_browser = false },
      respect_gitignore = false,
      depth = 1,
      display_stat = false,
      disable_devicons = true,
    },
  },

  pickers = {
    find_files = {
      path_display = function(opts, path)
        local tail = require("telescope.utils").path_tail(path)
        return string.format("%s - %s", tail, path)
      end,
      find_command = { "fd", "--type", "file", "--hidden" },
      disable_devicons = true,
    },
    live_grep = {
      only_sort_text = true,
      additional_args = function(opts)
        return { "--hidden" }
      end,
      disable_devicons = true,
    },
    grep_string = {
      only_sort_text = true,
      additional_args = function(opts)
        return { "--hidden" }
      end,
      disable_devicons = true,
    },
    buffers = {
      path_display = function(opts, path)
        local tail = require("telescope.utils").path_tail(path)
        return string.format("%s - %s", tail, path)
      end,
      mappings = {
        i = {
          ["<C-d>"] = require("telescope.actions").delete_buffer,
        },
      },
      disable_devicons = true,
    },
  },
})

require("telescope").load_extension("file_browser")
require("telescope").load_extension("harpoon")
