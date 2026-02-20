return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  dependencies = { "nvim-lualine/lualine.nvim" },
  opts = function()
    return {
      commentStyle = { italic = false },
      keywordStyle = { italic = false },
      overrides = function()
        return { ["@variable.builtin"] = { italic = false } }
      end,
    }
  end,
  config = function(_, opts)
    require("kanagawa").setup(opts)
    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}
