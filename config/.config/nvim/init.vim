set background=dark
set shell=/bin/zsh

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
silent !mkdir -p ~/.config/nvim/tmp/{backup,swap,undo,session}

set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/swap,.
set undofile
set undodir=~/.config/nvim/tmp/undo,.

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on

set termguicolors

" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling three lines before the horizontal window border
set scrolloff=3

set updatetime=100

set number relativenumber

" Show at most this many items in the popup menu
set pumheight=10

set foldtext=getline(v:foldstart).'...'.trim(getline(v:foldend)).'\ ('.(v:foldend-v:foldstart).'\ lines)'
set fillchars=fold:\\

xnoremap p pgvy
nnoremap \ :noh<return>

" Format tables in feature files. Mostly works.
function! FormatTable()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :g/\|/Tab /|
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

nnoremap <leader>ft :call FormatTable()<CR>

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>s :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
   " Jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

" coc config
set signcolumn=yes

let g:coc_global_extensions = [
  \ 'coc-pairs',
  \ 'coc-prettier',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-yaml',
  \ 'coc-go',
  \ 'coc-java'
  \ ]

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for code-actions
nmap <leader>ab  <Plug>(coc-codeaction)
nmap <leader>al  <Plug>(coc-codeaction-line)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>rn <Plug>(coc-rename)

nmap <leader>f  <Plug>(coc-format)

setlocal foldmethod=expr
setlocal foldexpr=nvim_treesitter#foldexpr()

set noshowmode
set noshowcmd
set shortmess+=F

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fp <cmd>Telescope project<cr>
nnoremap <leader>fe <cmd>Telescope file_browser<cr>

nnoremap <leader>o <cmd>Telescope oldfiles only_cwd=true<cr>
nnoremap <leader>og <cmd>Telescope oldfiles <cr>

" Fugitive {
if isdirectory(expand("~/.config/nvim/plugged/vim-fugitive/"))
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
  nnoremap <silent> <leader>gi :Git add -p %<CR>
endif
"}

let loaded_netrwPlugin = 1

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', { 'do': 'npm install' }
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'godlygeek/tabular'
call plug#end()

lua require('plugins.nvim-treesitter')
lua require('plugins.telescope')
lua require('plugins.bufferline')
lua require('plugins.lualine')
lua require('plugins.catppuccin')

