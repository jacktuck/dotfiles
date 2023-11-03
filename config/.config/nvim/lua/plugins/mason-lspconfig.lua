require("mason-lspconfig").setup({
  ensure_installed = {
    "tsserver",
    "pyright",
    "lua_ls",
    "rust_analyzer",
    "docker_compose_language_service",
    "bashls",
    "gopls",
  },
})
