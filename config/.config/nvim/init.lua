local vim = vim

local options = {
  -- cmdheight = 0,
  swapfile = false,
  undofile = true,
  expandtab = true,
  smartindent = true,
  tabstop = 2,
  shiftwidth = 2,
  clipboard = "unnamedplus",
  wildmenu = true,
  backspace = "indent,eol,start",
  gdefault = true,
  encoding = "utf-8",
  binary = true,
  modeline = true,
  modelines = 4,
  exrc = true,
  secure = true,
  number = true,
  termguicolors = true,
  cursorline = true,
  listchars = "tab:▸ ,trail:·,eol:¬,nbsp:_",
  list = true,
  hlsearch = true,
  incsearch = true,
  laststatus = 2,
  ruler = true,
  shortmess = "csCFSW",
  showmode = false,
  title = true,
  showcmd = true,
  scrolloff = 3,
  updatetime = 100,
  relativenumber = true,
  pumheight = 10,
  background = "dark",
  signcolumn = "yes",
  -- spell = true,
  -- spelllang = { "en_us" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--
vim.loader.enable()

--Change mapleader
vim.g.mapleader = " "

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
    "rebelot/kanagawa.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "<leader>gd", "<cmd><CR>", desc = "Git Diff View" },
    },
  },
  {
    "dstein64/vim-startuptime",
    event = "VeryLazy",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },
  {
    "tpope/vim-abolish",
    event = "VeryLazy",
  },
  {
    "ThePrimeagen/harpoon",
    event = "VeryLazy",
  },
  {
    "ruifm/gitlinker.nvim",
    opts = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "LazyFile",
    opts = function()
      require("plugins.gitsigns")
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    event = "VeryLazy",
  },
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },
  {
    "nvim-lua/popup.nvim",
    lazy = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    opts = function()
      require("plugins.telescope")
    end,
    dependencies = {
      "prochri/telescope-all-recent.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "kkharji/sqlite.lua",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "LazyFile", "VeryLazy" },
    opts = function()
      require("plugins.nvim-treesitter")
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      require("plugins.lualine")
    end,
  },
  {
    "godlygeek/tabular",
    event = "VeryLazy",
  },
  {
    "romainl/vim-cool",
    event = "VeryLazy",
  },
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      require("plugins.none-ls")
    end,
  },
  {
    "williamboman/mason.nvim",
    config = true,
    lazy = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    config = function()
      require("plugins.mason-lspconfig")
    end,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
    },
    config = function()
      require("plugins.nvim-lspconfig")
    end,
  },
  {
    "Wansmer/treesj",
    keys = { "<space>m", "<space>j", "<space>s" },
    config = true,
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        disable_float_background = true,
        disable_italics = true,
      })
      vim.cmd.colorscheme("rose-pine")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "f3fora/cmp-spell",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      require("plugins.nvim-cmp")
    end,
  },
  {
    "vim-test/vim-test",
    event = "VeryLazy",
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },
})

require("mappings")

vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#runner"] = "jest"
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Auto create dir when saving a file, in case some intermediate directory does not exist
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup("auto_create_dir"),
  callback = function(event)
    if event.match:match("^%w%w+://") then
      return
    end
    local file = vim.loop.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.cmd("syntax on")

-- vim.cmd([[ autocmd RecordingEnter * set cmdheight=1 ]])
-- vim.cmd([[ autocmd RecordingLeave * set cmdheight=0 ]])
