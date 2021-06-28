set statusline=%(\ %{fugitive#head()}\ \ \|%)
" set statusline+=%{expand('%:~:F')}
set statusline+=%(\ \ %{pathshorten(expand('%:~:F'))}\ \ %) " File path

set statusline+=%= " Align right
set statusline+=%(\ \ %{&filetype}\ \ \|%) " File type
set statusline+=%(%3p%%\ \ \|%) " File progress
set statusline+=%3l(%L):%-3c " Line/column number
