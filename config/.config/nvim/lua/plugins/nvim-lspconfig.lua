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
        bashls = { capabilities = capabilities, filetypes = { "sh", "zsh" }, settings = { filetypes = { "sh", "zsh" } } },
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
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
        local map = function(mode, lhs, rhs) vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf }) end
        map("n", "gD", vim.lsp.buf.declaration)
        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gi", vim.lsp.buf.implementation)
        map("n", "<leader>r", vim.lsp.buf.rename)
        map("n", "<leader>h", vim.lsp.buf.signature_help)
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
        map("n", "do", vim.diagnostic.open_float)
        map("n", "dq", vim.diagnostic.setqflist)
        map("n", "[d", vim.diagnostic.goto_prev)
        map("n", "]d", vim.diagnostic.goto_next)
      end,
    })
    vim.diagnostic.config(opts.diagnostics)
  end,
}
