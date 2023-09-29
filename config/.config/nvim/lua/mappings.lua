-- Refactorings
vim.keymap.set('n', '<leader>lc', "\"ayiwoconsole.log(\"<C-R>a:\",<C-R>a);<Esc>0", {})
vim.keymap.set('n', '<leader>li', "\"ayiwologger.info(\"<C-R>a:\",<C-R>a);<Esc>0", {})
vim.keymap.set('n', '<leader>le', "\"ayiwologger.error(\"<C-R>a:\",<C-R>a);<Esc>0", {})

-- Source vimrc
vim.keymap.set('n', '<leader><leader>r', ":source $MYVIMRC<CR>", {})

-- Vim-test
vim.keymap.set('n', '<leader>tn', ":TestNearest<CR>", {})
vim.keymap.set('n', '<leader>tf', ":TestFile<CR>", {})
vim.keymap.set('n', '<leader>ta', ":TestSuite<CR>", {})
vim.keymap.set('n', '<leader>tv', ":TestVisit<CR>", {})

-- Fugitive
vim.keymap.set('n', '<leader>G', ":Git<CR>", {})
vim.keymap.set('n', '<leader>gd', ":Git diff<CR>", {})
vim.keymap.set('n', '<leader>gl', ":Git l<CR>", {})
vim.keymap.set('n', '<leader>gc', function()
	local msg = vim.fn.input("Commit msg: ")
	if (msg ~= nil and msg ~= '') then
		return ':Git commit -m "' .. msg .. '"<CR>'
	end
end, { expr = true })

vim.keymap.set('n', '<leader>gw', ":Gwrite<CR>", {})
vim.keymap.set('n', '<leader>gr', ":Gread<CR>", {})
vim.keymap.set('n', '<leader>gb', ":Git blame<CR>", {})
vim.keymap.set('n', '<leader>gv', ":Git show<CR>", {})
vim.keymap.set('n', '<leader>gP', ":Git push<CR>", {})
vim.keymap.set('n', '<leader>gp', ":Git pull<CR>", {})
vim.keymap.set('n', '<leader>go', ":GBrowse<CR>", {})

-- Telescope
vim.keymap.set('n', '<leader>f.', ":Telescope resume<CR>", {})
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", {})
vim.keymap.set('n', '<leader>fs', ":Telescope git_status<CR>", {})
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", {})
vim.keymap.set("n", "<leader>fe", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {})
vim.keymap.set('n', '<leader>fb', function()
	require('telescope.builtin').buffers({ ignore_current_buffer = true, sort_mru = true })
end)

-- Quickfix lists
vim.keymap.set('n', '[q', ":cp<CR>", {})
vim.keymap.set('n', ']q', ":cn<CR>", {})

-- Treesitter
vim.keymap.set("n", "[c", function()
	require("treesitter-context").go_to_context()
end, { silent = true })

-- Tabular
vim.keymap.set('n', '<leader>ft', ':g/|/Tab /|<CR>', {})

-- Write file
vim.keymap.set('n', '<leader>w', ':w<CR>', {})
vim.keymap.set('n', '<leader>wq', ':wq<CR>', {})
vim.keymap.set('n', '<leader>wqa', ':wqa<CR>', {})

-- Write file as sudo
vim.keymap.set('n', '<leader>W', ':w !sudo tee % > /dev/null<CR>', {})

-- Clear search highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', {})

-- Buffers
vim.keymap.set('n', '[b', ':bprevious<CR>', {})
vim.keymap.set('n', ']b', ':bnext<CR>', {})
vim.keymap.set('n', 'bd', ':bd<CR>', {})
vim.keymap.set('n', 'bd!', ':bd!<CR>', {})
vim.keymap.set('n', 'bda', ':bufdo bd<CR>', {})
vim.keymap.set('n', 'bda!', ':bufdo bd!<CR>', {})

vim.keymap.set('n', '<leader>f', ':lua vim.lsp.buf.format()<CR>', {})

-- TODO: convert to a lua function
vim.keymap.set('n', '<leader>lv', '$T#dt"F:lvt#y | :let a=system("latestLibTag", @")[:-2] | exec ".s/#/#".a."/g"<CR>', {})
