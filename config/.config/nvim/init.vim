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



" Automatic commands
if has("autocmd")
   " Jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set signcolumn=yes
set noshowmode
set noshowcmd
set shortmess+=F

let loaded_netrwPlugin = 1

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'windwp/nvim-autopairs'
Plug 'sheerun/vim-polyglot'
Plug 'lewis6991/gitsigns.nvim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'godlygeek/tabular'
Plug 'romainl/vim-cool'
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'projekt0n/github-nvim-theme'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-calc'
Plug 'andersevenrud/cmp-tmux'
Plug 'rafamadriz/friendly-snippets'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rmagatti/auto-session'
Plug 'vim-test/vim-test'
call plug#end()

lua << EOF
	local modules = {
    "plugins.nvim-treesitter",
    "plugins.telescope",
    "plugins.auto-session",
    "plugins.lualine",
    "plugins.null-ls",
    "plugins.nvim-cmp",
    "plugins.nvim-lspconfig",
    "plugins.mason",
    "plugins.gitsigns",
    "plugins.nvim-autopairs",
    "mappings",
	}

	-- Refresh module cache
	for k, v in pairs(modules) do
		package.loaded[v] = nil
		require(v)
	end
EOF

let test#strategy = "neovim"
let g:test#javascript#runner = "jest"

if has('nvim')
  tmap <C-o> <C-\><C-n>
endif


colorscheme github_dark_dimmed
" colorscheme github_dark_high_contrast