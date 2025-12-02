return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  dependencies = { "saghen/blink.cmp" },
  opts = function()
    return {}
  end,
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)
  end,
}
