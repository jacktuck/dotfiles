return {
  "dstein64/vim-startuptime",
  event = "VeryLazy",
  cmd = "StartupTime",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    return { tries = 10 }
  end,
  config = function(_, opts)
    vim.g.startuptime_tries = opts.tries
  end,
}
