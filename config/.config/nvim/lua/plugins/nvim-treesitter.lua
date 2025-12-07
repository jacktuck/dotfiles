return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter-context" },
  opts = function()
    return {
      ensure_installed = {
        "typescript",
        "javascript",
        "python",
        "json",
        "java",
        "go",
        "lua",
        "rust",
      },
      auto_install = true,
      highlight = {
        enable = true,
        disable = function(_, bufnr)
          local ok, parsers = pcall(require, "nvim-treesitter.parsers")
          if ok then
            local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
            if not parsers.has_parser(ft) then return true end
          end
          return vim.api.nvim_buf_line_count(bufnr) > 10000
        end,
        additional_vim_regex_highlighting = false,
      },
      context = {
        enable = true,
        max_lines = 2,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = "outer",
        mode = "cursor",
        separator = nil,
        zindex = 20,
        on_attach = nil,
      },
    }
  end,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    require("treesitter-context").setup(opts.context)
  end,
}
