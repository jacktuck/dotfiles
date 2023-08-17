--
-- Refactorings
vim.keymap.set('n', '<leader>lc', "\"ayiwoconsole.log(\"<C-R>a:\", <C-R>a);<Esc>0", {})
vim.keymap.set('n', '<leader>li', "\"ayiwologger.info(\"<C-R>a:\", <C-R>a);<Esc>0", {})
vim.keymap.set('n', '<leader>le', "\"ayiwologger.error(\"<C-R>a:\", <C-R>a);<Esc>0", {})

-- Source vimrc
vim.keymap.set('n', '<leader><leader>r', ":source $MYVIMRC<CR>", {})

-- Vim-test
vim.keymap.set('n', '<leader>tn', ":TestNearest<CR>", {})
vim.keymap.set('n', '<leader>tf', ":TestFile<CR>", {})
vim.keymap.set('n', '<leader>ta', ":TestSuite<CR>", {})
vim.keymap.set('n', '<leader>tv', ":TestVisit<CR>", {})

-- Fugitive
-- vim.keymap.set('n', '<leader>gd', ":Git diff<CR>", {})
-- vim.keymap.set('n', '<leader>gs', ":Git status<CR>", {})
-- vim.keymap.set('n', '<leader>gl', ":Git log<CR>", {})
vim.keymap.set('n', '<leader>gc', ":Git commit<CR>", {})
vim.keymap.set('n', '<leader>gi', ":Git add -p .<CR>", {})
vim.keymap.set('n', '<leader>gp', ":Git push<CR>", {})
vim.keymap.set('n', '<leader>blame', ":Git blame<CR>", {})

-- Telescope
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", {})
-- vim.keymap.set("n", "<leader>fb", ":Telescope file_browser<CR>", {})
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
vim.keymap.set('n', '<leader>fg', function()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ")})
end)
vim.keymap.set('n', '<leader>fw', function()
	require('telescope.builtin').grep_string();
end)
vim.keymap.set('n', '<leader>fc', ":Telescope treesitter<CR>", {})
vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", {})
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>", {})
vim.keymap.set('n', '<leader>gs', ":Telescope git_status<CR>", {})

-- Quickfix lists
vim.keymap.set('n', '[q', ":cp<CR>", {})
vim.keymap.set('n', ']q', ":cn<CR>", {})

-- Tabular
vim.keymap.set('n', '<leader>ft', ':g/|/Tab /|<CR>', {})

-- Write file
vim.keymap.set('n', '<leader>w', ':w <CR>', {})

-- Write file as sudo
vim.keymap.set('n', '<leader>W', ':w !sudo tee % > /dev/null<CR>', {})

-- Clear search highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', {})

vim.keymap.set('n', '[b', ':bprevious<CR>', {})
vim.keymap.set('n', ']b', ':bnext<CR>', {})

vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', {})

-- TODO: convert to a lua function
vim.keymap.set('n', '<leader>lv','$T#dt"F:lvt#y | :let a=system("latestLibTag", @")[:-2] | exec ".s/#/#".a."/g"<CR>', {})