require 'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "typescript",
    "javascript",
    "python",
    "json",
    "java",
    "go",
    "lua",
    "rust"
  },
  highlight = {
    -- enable = true
  },
  auto_install = true,
}
