function! StatusLineGitFlag()
  if !exists('b:git_dirty_flag')
    let b:git_dirty_flag = functions#GitExecInPath("git status -s")[:-2]
    if b:git_dirty_flag == ""
      let b:git_dirty_flag = ''
    else
      let b:git_dirty_flag = '*'
    endif
  endif


  if !exists('b:git_behind_flag')
    let b:git_behind_flag = functions#GitExecInPath("git rev-list HEAD...origin/main")[:-2]
    if b:git_behind_flag == ""
      let b:git_behind_flag = ''
    else
      let b:git_behind_flag = ' ⇣'
    endif
  endif

  return b:git_dirty_flag . b:git_behind_flag
endfunction

set statusline=%(\ %{fugitive#head()}%)
set statusline+=%(\ %{StatusLineGitFlag()}\ \ \|%)
" set statusline+=%{expand('%:~:F')}
set statusline+=%(\ \ %{pathshorten(expand('%:~:F'))}\ \ %) " File path

set statusline+=%= " Align right
set statusline+=%(\ \ %{&filetype}\ \ \|%) " File type
set statusline+=%(%3p%%\ \ \|%) " File progress
set statusline+=%3l(%L):%-3c " Line/column number
