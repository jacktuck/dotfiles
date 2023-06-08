local builtin = require('telescope.builtin')

require 'telescope'.setup {
  defaults = require('telescope.themes').get_dropdown {
    file_ignore_patterns = { ".git/" },
  },
  extensions = {
    file_browser = {
      hidden = { file_browser = true, folder_browser = false },
      respect_gitignore = false,
      depth = 1,
    },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden" },
    },
    live_grep = {
      additional_args = function(opts)
        return { "--hidden" }
      end
    },
  }
}

require("telescope").load_extension "file_browser"
