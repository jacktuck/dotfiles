return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  opts = function()
    return {
      winopts = {
        height = 0.85,
        preview = { default = false },
      },
      files = {
        fd_opts = "--type f --hidden --exclude .git",
        formatter = "path.filename_first",
        file_icons = false,
        git_icons = false,
      },
      grep = {
        rg_opts = "--hidden --line-number --column --smart-case",
      },
      buffers = {
        sort_mru = true,
        ignore_current_buffer = true,
        formatter = "path.filename_first",
        file_icons = false,
        git_icons = false,
      },
      undotree = {
        previewer = "undotree_native",
        locate = false,
      },
    }
  end,
  keys = {
    {
      "<leader>f",
      function()
        require("fzf-lua").files({})
      end,
      desc = "Find files",
    },
    {
      "<leader>s",
      function()
        require("fzf-lua").live_grep({})
      end,
      desc = "Live grep",
    },
    {
      "<leader>b",
      function()
        require("fzf-lua").buffers({ sort_mru = true, ignore_current_buffer = true })
      end,
      desc = "Buffers",
    },
    {
      "<leader>u",
      function()
        require("fzf-lua").undotree()
      end,
      desc = "Undotree",
    },
  },

}
