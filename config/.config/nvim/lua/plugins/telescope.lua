local builtin = require('telescope.builtin')

require 'telescope'.setup {
  defaults = require('telescope.themes').get_dropdown {
    path_display = { "truncate" },
    file_ignore_patterns = { ".git/" },
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
    grep_string = {
      only_sort_text = true,
      additional_args = function(opts)
        return { "--hidden" }
      end
    },
    live_grep = {
      only_sort_text = true,
      additional_args = function(opts)
        return { "--hidden" }
      end
    },
  }
}

require("telescope").load_extension "file_browser"
