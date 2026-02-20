--[[ Some keymaps are created unconditionally when Nvim starts:
- "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
- "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
- "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
- CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()| ]]

return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = { "williamboman/mason.nvim", "saghen/blink.cmp" },
  opts = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()
    return {
      servers = {
        ts_ls = { settings = { completions = { completeFunctionCalls = true } }, capabilities = capabilities },
        pyright = { capabilities = capabilities },
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
          capabilities = capabilities,
        },
        rust_analyzer = { capabilities = capabilities },
        docker_compose_language_service = { capabilities = capabilities },
        bashls = {
          capabilities = capabilities,
          filetypes = { "sh", "zsh" },
          settings = { filetypes = { "sh", "zsh" } },
        },
        gopls = { capabilities = capabilities },
      },
      diagnostics = {
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "",
          },
          numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          },
        },
      },
    }
  end,
  config = function(_, opts)
    vim.env.PATH = vim.env.NODE_20 .. ":" .. vim.env.PATH
    local lspconfig = require("lspconfig")
    for server, server_opts in pairs(opts.servers) do
      lspconfig[server].setup(server_opts)
    end
    vim.diagnostic.config(opts.diagnostics)
  end,
}
