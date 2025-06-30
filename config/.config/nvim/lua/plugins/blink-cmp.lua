local blink_cmp = require("blink.cmp")
blink_cmp.setup({
  -- Presets for accept key: 'default' (C-y), 'super-tab' (Tab), 'enter', 'none'
  -- Common mappings: C-space open menu/docs, C-n/p navigate, C-e hide, C-k toggle sig help
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

  appearance = {
    -- 'mono' for Nerd Font Mono, aligns icons nicely; 'normal' for Nerd Font
    nerd_font_variant = "mono",
  },

  completion = {
    -- Docs popup shows only when triggered (not automatically)
    documentation = { auto_show = true },
  },

  sources = {
    -- Default providers, can be extended elsewhere without redefining
    default = { "lsp", "path", "snippets", "buffer" },
  },

  fuzzy = {
    -- Rust fuzzy matcher for better perf and typo tolerance
    -- Fallback to Lua matcher with warning if Rust not available
    implementation = "prefer_rust_with_warning",
  },
})
