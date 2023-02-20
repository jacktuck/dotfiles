-- Fugitive
vim.keymap.set('n', '<leader>gd', ":Git diff<CR>", {})
vim.keymap.set('n', '<leader>gs', ":Git status<CR>", {})
vim.keymap.set('n', '<leader>gl', ":Git log<CR>", {})
vim.keymap.set('n', '<leader>gc', ":Git commit<CR>", {})
vim.keymap.set('n', '<leader>gi', ":Git add -p .<CR>", {})
vim.keymap.set('n', '<leader>gp', ":Git push<CR>", {})
vim.keymap.set('n', '<leader>blame', ":Git blame<CR>", {})

-- Telescope
vim.keymap.set('n', '<leader>ff', ":Telescope find_files<CR>", {})
vim.keymap.set('n', '<leader>fg', ":Telescope live_grep<CR>", {})
vim.keymap.set('n', '<leader>fb', ":Telescope buffers<CR>", {})
vim.keymap.set('n', '<leader>fc', ":Telescope treesitter<CR>", {})
vim.keymap.set('n', '<leader>gc', ":Telescope git_commits<CR>", {})
vim.keymap.set('n', '<leader>gb', ":Telescope git_branches<CR>", {})

-- Tabular
vim.keymap.set('n', '<leader>ft', ':g/|/Tab /|<CR>', {})

-- Write file
vim.keymap.set('n', '<leader>w', ':w <CR>', {})

-- Write file as sudo
vim.keymap.set('n', '<leader>W', ':w !sudo tee % > /dev/null<CR>', {})

-- Clear search highlight
vim.keymap.set('n', '<Esc>', ':noh<CR>', {})

