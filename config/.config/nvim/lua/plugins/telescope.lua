local builtin = require('telescope.builtin')

require 'telescope'.setup {
  defaults = require('telescope.themes').get_ivy {
    path_display = { "truncate" },
    file_ignore_patterns = { ".git/" },
    preview = {
      treesitter = false
    },
    layout_config = {
      height = 100,
    },
  },
  extensions = {
    file_browser = {
      preview = {
        ls_short = true,
      },
      hidden = { file_browser = true, folder_browser = false },
      respect_gitignore = false,
      depth = 1,
      display_stat = false,
    },
  },

  pickers = {
    find_files = {
      find_command = { "fd", "--type", "file", "--hidden" },
    },
    live_grep = {
      only_sort_text = true,
      additional_args = function(opts)
        return { "--hidden" }
      end
    },
    grep_string = {
      only_sort_text = true,
      additional_args = function(opts)
        return { "--hidden" }
      end
    },
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = require('telescope.actions').delete_buffer
        }
      }
    }
  }
}

require("telescope").load_extension("file_browser")
require("telescope").load_extension("harpoon")
