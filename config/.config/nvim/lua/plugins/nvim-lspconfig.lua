-- tsserver requires node 14
vim.env.PATH = vim.env.NODE_14 .. ":" .. vim.env.PATH

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("lspconfig").tsserver.setup({
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
    vim.keymap.set({ "n", "v" }, "<leader>df", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "do", vim.diagnostic.open_float)
    vim.keymap.set("n", "dq", vim.diagnostic.setqflist)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
  end,
})

vim.diagnostic.config({ signs = true, virtual_text = false })

vim.fn.sign_define("DiagnosticSignError", { numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { numhl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignInfo", { numhl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { numhl = "DiagnosticSignHint" })
