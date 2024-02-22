local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.eslint_d.with({
      parefer_local = "node_modules/.bin",
      diagnostics_format = "[#{c}] #{m} (#{s})",
    }),
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
      diagnostics_format = "[#{c}] #{m} (#{s})",
    }),
  },

  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
          vim.lsp.buf.format({
            filter = function(client)
              return client.name == "null-ls"
            end,
            async = false,
          })
        end,
      })
    end
  end,
  debug = false,
})
