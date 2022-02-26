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
