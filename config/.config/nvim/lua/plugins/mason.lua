require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "tsserver@0.11.2", -- node 12 support
        "pyright",
        "lua_ls",
        "rust_analyzer",
        "docker_compose_language_service",
        "bashls",
        "gopls"
    }
}
