local builtin = require('telescope.builtin')

require'telescope'.setup{
  defaults = require('telescope.themes').get_dropdown {},
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden"},
    }
  }
}

_G.open_telescope = function()
    local first_arg = vim.v.argv[2]
    if first_arg and vim.fn.isdirectory(first_arg) == 1 then
      if first_arg == '.' then
        first_arg = null
      end

      builtin.find_files({
        find_command = { "rg", "--files", "--hidden" },
        search_dirs = {first_arg}
      })
    end
end

vim.api.nvim_exec([[
augroup TelescopeOnEnter
    autocmd!
    autocmd VimEnter * lua open_telescope()
augroup END
]], false)

