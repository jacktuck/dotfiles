print('hello from ~/config/nvim/lua/plugins/nvim-treesitter.lua')

require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true
  }
}

