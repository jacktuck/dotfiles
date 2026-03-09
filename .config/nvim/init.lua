local vim = vim

local options = {
  -- cmdheight = 0,
  swapfile = false,
  undofile = true,
  clipboard = "unnamedplus",
  wildmenu = true,
  backspace = "indent,eol,start",
  gdefault = true,
  encoding = "utf-8",
  modeline = true,
  modelines = 4,
  exrc = true,
  secure = true,
  number = true,
  termguicolors = true,
  cursorline = true,
  listchars = "tab:▸ ,trail:·,nbsp:_",
  list = true,
  hlsearch = true,
  incsearch = true,
  conceallevel = 2,
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
  signcolumn = "yes",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

--
vim.loader.enable()

--Change mapleader
vim.g.mapleader = " "

-- Keymaps
vim.keymap.set("n", "<leader><leader>", ":b#<CR>", { noremap = true, silent = true, desc = "Alternate buffer" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])

-- Logging
vim.keymap.set("n", "<leader>lc", '"ayiwoconsole.log("<C-R>a:",<C-R>a);<Esc>0', { desc = "Console log current word" })
vim.keymap.set("n", "<leader>li", '"ayiwologger.info("<C-R>a:",<C-R>a);<Esc>0', { desc = "Logger info current word" })
vim.keymap.set("n", "<leader>le", '"ayiwologger.error("<C-R>a:",<C-R>a);<Esc>0', { desc = "Logger error current word" })

-- Re-center vertical jumps
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up half page, center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half page, center" })
vim.keymap.set("n", "n", "nzz", { desc = "Next match, center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev match, center" })

-- Write file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>W", ":noautocmd w<CR>", { desc = "Write without formatting" })
vim.keymap.set("n", "<leader>w!", ":w !sudo tee % > /dev/null<CR>", { desc = "Write as sudo" })

-- Buffers
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })

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

vim.g.sleuth_debug = 1
require("lazy").setup("plugins")

vim.g["test#strategy"] = "neovim"
vim.g["test#javascript#runner"] = "jest"

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

vim.filetype.add({
  pattern = {
    ["%.%a+"] = "zsh", --set filetype for dotfiles with no extension
  },
})
