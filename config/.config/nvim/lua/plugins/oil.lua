return {
  "stevearc/oil.nvim",
  lazy = false,
  opts = function()
    return {}
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function(_, opts)
    require("oil").setup(opts)
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
