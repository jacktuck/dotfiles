return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  opts = function() return {} end,
  config = function(_, opts) end,
  keys = {
    { "<leader>gd", "<cmd><CR>", desc = "Git Diff View" },
  },
}
