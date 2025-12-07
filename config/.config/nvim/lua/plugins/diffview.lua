return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  opts = function() return {} end,
  config = function(_, opts) end,
  keys = {
    { "<leader>gd", function() require("diffview").open() end, desc = "DiffView: Open" },
    { "<leader>gD", function() require("diffview").close() end, desc = "DiffView: Close" },
  },
}
