-- tsserver requires node 14
vim.env.PATH = vim.env.NODE_14 .. ":" .. vim.env.PATH

require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {
        "tsserver",
        "pyright",
        "lua_ls",
        "rust_analyzer",
        "docker_compose_language_service",
        "bashls",
        "gopls"
    }
}
