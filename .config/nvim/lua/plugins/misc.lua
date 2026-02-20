return {
  { "tpope/vim-sleuth",    lazy = false },
  { "tpope/vim-abolish",   event = "VeryLazy" },
  { "tpope/vim-fugitive",  event = "VeryLazy",
    keys = {
      { "<leader>G", ":vert Git | vert resize 60<CR>", desc = "Git UI" },
      { "<leader>gd", ":Git diff<CR>", desc = "Git diff" },
      { "<leader>gl", ":Git l<CR>", desc = "Git log" },
      { "<leader>gc", ":Git commit -v | :only | :norm! gg<CR>", desc = "Git commit" },
      { "<leader>gw", ":Gwrite<CR>", desc = "Git write" },
      { "<leader>gr", ":Gread<CR>", desc = "Git read" },
      { "<leader>gb", ":Git blame<CR>", desc = "Git blame" },
      { "<leader>gv", ":Git show<CR>", desc = "Git show" },
      { "<leader>gP", ":Git push<CR>", desc = "Git push" },
      { "<leader>gp", ":Git pull<CR>", desc = "Git pull" },
    },
  },
  { "tpope/vim-surround",  event = "VeryLazy" },
  { "tpope/vim-repeat",    event = "VeryLazy" },
  { "tpope/vim-rsi",       event = "VeryLazy" },
  { "christoomey/vim-tmux-navigator", event = "VeryLazy" },
  { "romainl/vim-cool",    event = "VeryLazy" },
  { "godlygeek/tabular",   event = "VeryLazy",
    keys = {
      { "<leader>T", ":g/|/Tab /|<CR>", desc = "Tabular align pipes" },
    },
  },
  { "vim-test/vim-test",   event = "VeryLazy" },
  { "nvim-lua/plenary.nvim", lazy = true },
  { "nvim-lua/popup.nvim",   lazy = true },
  { "ThePrimeagen/harpoon",  event = "VeryLazy", dependencies = { "nvim-lua/plenary.nvim" },
    keys = (function()
      local keys = {
        { "<leader>m", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu" },
        { "<leader>M", function() require("harpoon.mark").toggle_file() end, desc = "Harpoon mark" },
      }
      for i = 1, 9 do
        table.insert(keys, { "<leader>" .. i, function() require("harpoon.ui").nav_file(i) end, desc = "Harpoon goto " .. i })
      end
      return keys
    end)(),
  },
  { "ruifm/gitlinker.nvim",  event = "VeryLazy", opts = true, dependencies = { "nvim-lua/plenary.nvim" } },
  { "numToStr/Comment.nvim", event = "VeryLazy", config = true },
  { "folke/noice.nvim",      lazy = true, opts = {}, dependencies = { "MunifTanjim/nui.nvim" } },
  { "stevearc/quicker.nvim", event = "FileType qf", opts = {}, config = function() require("quicker").setup() end,
    keys = {
      { "[q", ":cp<CR>", desc = "Quickfix prev" },
      { "]q", ":cn<CR>", desc = "Quickfix next" },
    },
  },
  { "folke/which-key.nvim", event = "VeryLazy", opts = { icons = { mappings = false }, triggers = {} },
    keys = {
      { "<leader>?", ":WhichKey<CR>", desc = "WhichKey help" },
    },
  },
}
