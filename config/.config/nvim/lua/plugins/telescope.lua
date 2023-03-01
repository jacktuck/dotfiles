local builtin = require('telescope.builtin')

require 'telescope'.setup {
  defaults = require('telescope.themes').get_dropdown {},
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
