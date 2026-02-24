return {
  "saghen/blink.cmp",
  version = "1.*",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
  opts = {
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "cancel", "fallback" },
      ["<Tab>"] = {
        function(cmp)
          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
      ["<C-n>"] = { "select_next", "fallback_to_mappings" },
      ["<PageUp>"] = { "scroll_documentation_up", "fallback" },
      ["<PageDown>"] = { "scroll_documentation_down", "fallback" },
      ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
    },
    signature = { enabled = true },
    appearance = { nerd_font_variant = "mono" },
    completion = { documentation = { auto_show = true } },
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
}
