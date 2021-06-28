" Fugitive {{{1
function! functions#GitExecInPath(cmd, ...) "{{{2
  if a:0
    let path = a:1
  elseif exists('b:git_dir')
    let path = b:git_dir
    let path = fnamemodify(path, ':h')
  else
    let path = FugitiveExtractGitDir('.')
    let path = fnamemodify(path, ':h')
  endif

  return system('cd ' . fnameescape(path) . '; ' . a:cmd)
endfunction