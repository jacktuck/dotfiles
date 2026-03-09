return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    keys = {
      { "<leader>mp", ":MarkdownPreviewToggle<CR>", ft = "markdown", desc = "Markdown preview toggle" },
    },
  },
}
