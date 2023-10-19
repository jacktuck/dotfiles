local vim = vim
local options = {
	clipboard = "unnamedplus",
	wildmenu = true,
	backspace = "indent,eol,start",
	gdefault = true,
	encoding = "utf-8",
	binary = true,
	undofile = true,
	modeline = true,
	modelines = 4,
	exrc = true,
	secure = true,
	number = true,
	termguicolors = true,
	cursorline = true,
	tabstop = 2,
	listchars = "tab:▸ ,trail:·,eol:¬,nbsp:_",
	list = true,
	hlsearch = true,
	incsearch = true,
	laststatus = 2,
	-- noerrorbells=true,
	-- nostartofline=true,
	ruler = true,
	shortmess = "atI",
	showmode = true,
	title = true,
	showcmd = true,
	scrolloff = 3,
	updatetime = 100,
	relativenumber = true,
	pumheight = 10,
	background = "dark",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

--
vim.loader.enable()

--Change mapleader
vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local Event = require("lazy.core.handler.event")
Event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
Event.mappings["User LazyFile"] = Event.mappings.LazyFile

require("lazy").setup({
	{
		"dstein64/vim-startuptime",
		event = "VeryLazy",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{ 'tpope/vim-surround', event = "VeryLazy" },
	{ 'tpope/vim-repeat',   event = "VeryLazy" },
	{ 'tpope/vim-abolish',  event = "VeryLazy" },
	{ 'tpope/vim-fugitive', event = "VeryLazy" },
	{ 'tpope/vim-rhubarb',  event = "VeryLazy" },
	{ 'jacktuck/harpoon',   event = "VeryLazy" },
	{
		'lewis6991/gitsigns.nvim',
		event = "LazyFile",
		opts = function()
			require('plugins.gitsigns')
		end
	},
	{ 'christoomey/vim-tmux-navigator', event = "VeryLazy" },
	{ 'nvim-lua/plenary.nvim',          lazy = true },
	{ 'nvim-lua/popup.nvim',            lazy = true },
	{
		'nvim-telescope/telescope.nvim',
		event = "VeryLazy",
		opts = function() require('plugins.telescope') end,
		dependencies = { 'nvim-telescope/telescope-file-browser.nvim' },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			'nvim-treesitter/nvim-treesitter-context'
		}
	},
	{
		'nvim-lualine/lualine.nvim',
		event = "VeryLazy",
		opts = function() require('plugins.lualine') end,
	},
	{ 'godlygeek/tabular', event = "VeryLazy" },
	{ 'romainl/vim-cool',  event = "VeryLazy" },
	{
		'jose-elias-alvarez/null-ls.nvim',
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "mason.nvim" },
		opts = function() require('plugins.null-ls') end
	},
	{ 'williamboman/mason.nvim' },
	{ 'williamboman/mason-lspconfig.nvim' },
	{ 'neovim/nvim-lspconfig' },
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
			'L3MON4D3/LuaSnip',
		},
		opts = function() require('plugins.nvim-cmp') end
	},
	{
		'vim-test/vim-test',
		event = "VeryLazy"
	},
	{
		'numToStr/Comment.nvim',
		event = "VeryLazy",
		config = true
	},
})


local modules = {
	"plugins.mason",
	"plugins.nvim-treesitter",
	"plugins.nvim-lspconfig",
	"mappings",
	-- "plugins.lualine",
	-- "plugins.null-ls",
	-- "plugins.nvim-cmp",
	-- "plugins.gitsigns",
}

-- Refresh module cache
for k, v in pairs(modules) do
	package.loaded[v] = nil
	require(v)
end

vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#runner"] = "jest"
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]])

vim.cmd('syntax on')
vim.cmd("colorscheme catppuccin-frappe")
