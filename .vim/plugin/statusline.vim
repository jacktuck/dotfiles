set statusline=%(\ %{fugitive#head()}\ \ \|%)
" set statusline+=%{expand('%:~:F')}
set statusline+=%(\ \ %{pathshorten(expand('%:~:F'))}\ \ \|%) " File path
set statusline+=%(\ \ %{&filetype}\ \ %) " File type

set statusline+=%= " Align right
set statusline+=%(%3p%%\ \ \|%)
set statusline+=%3l(%L):%-3c
