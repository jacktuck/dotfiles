require("mason-lspconfig").setup({
  ensure_installed = {
    "ts_ls",
    "pyright",
    "lua_ls",
    "rust_analyzer",
    "docker_compose_language_service",
    "bashls",
    "gopls",
  },
  automatic_enable = false,
})
