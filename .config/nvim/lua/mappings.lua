-- Refactorings
vim.keymap.set("n", "<leader>lc", '"ayiwoconsole.log("<C-R>a:",<C-R>a);<Esc>0', { desc = "Console log current word" })
vim.keymap.set("n", "<leader>li", '"ayiwologger.info("<C-R>a:",<C-R>a);<Esc>0', { desc = "Logger info current word" })
vim.keymap.set("n", "<leader>le", '"ayiwologger.error("<C-R>a:",<C-R>a);<Esc>0', { desc = "Logger error current word" })

-- Re-center verticle jumps
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Up half page, center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Down half page, center" })
vim.keymap.set("n", "n", "nzz", { desc = "Next match, center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Prev match, center" })

-- Write file
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>W", ":noautocmd w<CR>", { desc = "Write without formatting" })
vim.keymap.set("n", "<leader>w!", ":w !sudo tee % > /dev/null<CR>", { desc = "Write as sudo" }) -- as sudo

-- Buffers
vim.keymap.set("n", "[b", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "]b", ":bnext<CR>", { desc = "Next buffer" })
