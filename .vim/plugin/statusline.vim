function! StatusLineGitFlag()
  if !exists('g:loaded_fugitive')
    return ''
  endif

  let b:git_branch = fugitive#head()

  if b:git_branch == ""
    return ''
  endif

  if !exists('b:git_dirty_flag')
    let b:git_dirty_flag = functions#GitExecInPath("git status -s")[:-2]
    if b:git_dirty_flag != ""
      let b:git_dirty_flag = '*'
    endif
  endif

  if !exists('b:git_behind_flag')
    let b:git_behind_flag = functions#GitExecInPath("git rev-list HEAD...origin/". b:git_branch)[:-2]
    if b:git_behind_flag != ""
      let b:git_behind_flag = ' ⇡'
    endif
  endif

  return b:git_branch . b:git_dirty_flag . b:git_behind_flag
endfunction

function! s:StatusLineClearVars()
  unlet! b:git_dirty_flag
  unlet! b:git_behind_flag
endfunction

augroup StatusLine
  au!
  autocmd WinEnter,CursorHold * call <SID>StatusLineClearVars()
augroup END

hi StatusLine cterm=bold gui=bold guibg=White guifg=Black

set statusline+=\ %{StatusLineGitFlag()}
" set statusline+=%{expand('%:~:F')}
set statusline+=\ \ %f " File path

set statusline+=%= " Align right
set statusline+=%y
set statusline+=\ \ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \ [%{&fileformat}\]
set statusline+=\ \ %p%%
set statusline+=\ \ %l:%c\ 
