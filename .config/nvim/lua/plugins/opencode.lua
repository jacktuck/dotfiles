return {
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    dependencies = {
      {
        "folke/snacks.nvim",
        optional = true,
        opts = {
          input = {},
          picker = {
            actions = {
              opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
            },
            win = { input = { keys = { ["<a-a>"] = { "opencode_send", mode = { "n", "i" } } } } },
          },
        },
      },
    },
    config = function()
      vim.g.opencode_opts = {}
      vim.o.autoread = true
    end,
    keys = {
      { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = "n", desc = "Ask opencode" },
      { "<leader>oa", function() require("opencode").ask("@this: ", { submit = true }) end, mode = "v", desc = "Ask opencode about selection" },
    },
  },
}
