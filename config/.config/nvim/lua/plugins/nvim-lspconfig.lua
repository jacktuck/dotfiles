-- ts_ls requires node 14
vim.env.PATH = vim.env.NODE_20 .. ":" .. vim.env.PATH

local capabilities = require("blink.cmp").get_lsp_capabilities()

require("lspconfig").ts_ls.setup({
  settings = {
    completions = {
      completeFunctionCalls = true,
    },
  },
  capabilities = capabilities,
})
require("lspconfig").pyright.setup({
  capabilities = capabilities,
})
require("lspconfig").lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})

require("lspconfig").rust_analyzer.setup({
  capabilities = capabilities,
})
require("lspconfig").docker_compose_language_service.setup({
  capabilities = capabilities,
})
require("lspconfig").bashls.setup({
  capabilities = capabilities,
  filetypes = { "sh", "zsh" },
  settings = {
    filetypes = { "sh", "zsh" },
  },
})
require("lspconfig").gopls.setup({
  capabilities = capabilities,
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>h", vim.lsp.buf.signature_help, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "do", vim.diagnostic.open_float)
    vim.keymap.set("n", "dq", vim.diagnostic.setqflist)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  end,
})

vim.diagnostic.config({
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
})
