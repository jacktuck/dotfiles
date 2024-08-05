-- Refactorings
vim.keymap.set("n", "<leader>lc", '"ayiwoconsole.log("<C-R>a:",<C-R>a);<Esc>0', {})
vim.keymap.set("n", "<leader>li", '"ayiwologger.info("<C-R>a:",<C-R>a);<Esc>0', {})
vim.keymap.set("n", "<leader>le", '"ayiwologger.error("<C-R>a:",<C-R>a);<Esc>0', {})

-- Re-center verticle jumps
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "n", "nzz", {})
vim.keymap.set("n", "N", "Nzz", {})

-- Vim-test
vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>", {})
vim.keymap.set("n", "<leader>tf", ":TestFile<CR>", {})
vim.keymap.set("n", "<leader>ta", ":TestSuite<CR>", {})
vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", {})

-- Fugitive
vim.keymap.set("n", "<leader>G", ":vert Git | vert resize 60<CR>", {})
vim.keymap.set("n", "<leader>gd", ":Git diff<CR>", {})
vim.keymap.set("n", "<leader>gl", ":Git l<CR>", {})
vim.keymap.set("n", "<leader>gc", ":Git commit -v | :only | :norm! gg<CR>", {})
vim.keymap.set("n", "<leader>gw", ":Gwrite<CR>", {})
vim.keymap.set("n", "<leader>gr", ":Gread<CR>", {})
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
vim.keymap.set("n", "<leader>gv", ":Git show<CR>", {})
vim.keymap.set("n", "<leader>gP", ":Git push<CR>", {})
vim.keymap.set("n", "<leader>gp", ":Git pull<CR>", {})

-- Telescope
vim.keymap.set("n", "<leader>B", function()
  require("telescope.builtin").buffers({ ignore_current_buffer = true, sort_mru = true })
end)
vim.keymap.set("n", "<leader>b", ":Telescope git_branches<CR>", {})
vim.keymap.set("n", "<leader>f", ":Telescope find_files<CR>", {})
vim.keymap.set("n", "<leader>F", ":Telescope file_browser<CR>", {})
vim.keymap.set("n", "<leader>s", ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>.", ":Telescope resume<CR>", {})

-- Quickfix lists
vim.keymap.set("n", "[q", ":cp<CR>", {})
vim.keymap.set("n", "]q", ":cn<CR>", {})

-- Treesitter
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context()
end, {})

-- Harpoon
vim.keymap.set("n", "<leader>m", function()
  require("harpoon.mark").toggle_file()
end, {})

vim.keymap.set("n", "<leader>MM", function()
  require("harpoon.mark").clear_all()
end, {})

for i = 1, 9 do
  vim.keymap.set("n", "<leader>" .. i, function()
    require("harpoon.ui").nav_file(i)
  end, {})
end

vim.keymap.set("n", "<leader>n", function()
  require("harpoon.ui").nav_next()
end, {})

vim.keymap.set("n", "<leader>p", function()
  require("harpoon.ui").nav_prev()
end, {})

-- Write file
vim.keymap.set("n", "<leader>w", ":w<CR>", {})
vim.keymap.set("n", "<leader>wq", ":wq<CR>", {})
vim.keymap.set("n", "<leader>W", ":w !sudo tee % > /dev/null<CR>", {}) -- as sudo

-- Buffers
vim.keymap.set("n", "[b", ":bprevious<CR>", {})
vim.keymap.set("n", "]b", ":bnext<CR>", {})

-- Tabular
vim.keymap.set("n", "<leader>T", ":g/|/Tab /|<CR>", {})

-- TODO: convert to a lua function
vim.keymap.set(
  "n",
  "<leader>lv",
  '$T#dt"F:lvt#y | :let a=system("latestLibTag", @")[:-2] | exec ".s/#/#".a."/g"<CR>',
  {}
)
