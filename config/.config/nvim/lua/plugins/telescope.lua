require'telescope'.setup{
  extensions = {
    project = {
      base_dirs = {
	'~/code',
      }
    }
  },
  defaults = {
    file_ignore_patterns = { ".git" }
  }
}

require'telescope'.load_extension('project')

_G.open_telescope = function()
    local first_arg = vim.v.argv[2]
    if first_arg and vim.fn.isdirectory(first_arg) == 1 then
        require("telescope.builtin").find_files({search_dirs = {first_arg}})
    end
end

vim.api.nvim_exec([[
augroup TelescopeOnEnter
    autocmd!
    autocmd VimEnter * lua open_telescope()
augroup END
]], false)
