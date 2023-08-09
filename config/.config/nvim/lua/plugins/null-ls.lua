local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint_d.with({
            prefer_local = "node_modules/.bin",
            diagnostics_format = "[#{c}] #{m} (#{s})",

        }),
        -- Should be able to just run eslint
        null_ls.builtins.formatting.prettierd.with({
            prefer_local = true,
            diagnostics_format = "[#{c}] #{m} (#{s})",
        })
    },
    debug = false
})
