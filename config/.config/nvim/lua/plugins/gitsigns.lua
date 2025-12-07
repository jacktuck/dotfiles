return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = function()
    return {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true,
      watch_gitdir = { follow_files = true },
      attach_to_untracked = true,
      current_line_blame = false,
      current_line_blame_opts = { virt_text = true, virt_text_pos = "eol", delay = 1000, ignore_whitespace = false },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
      max_file_length = 40000,
      preview_config = { border = "single", style = "minimal", relative = "cursor", row = 0, col = 1 },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(mode, lhs, rhs, opts)
          opts = opts or {}; opts.buffer = bufnr
          vim.keymap.set(mode, lhs, rhs, opts)
        end
        map("n", "]h", function()
          if vim.wo.diff then return "]c" end
          vim.schedule(gs.next_hunk)
          return "<Ignore>"
        end, { expr = true, desc = "Gitsigns next hunk" })
        map("n", "[h", function()
          if vim.wo.diff then return "[c" end
          vim.schedule(gs.prev_hunk)
          return "<Ignore>"
        end, { expr = true, desc = "Gitsigns prev hunk" })
        map("n", "<leader>hs", gs.stage_hunk, { desc = "Gitsigns stage hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Gitsigns reset hunk" })
        map("v", "<leader>hs", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Gitsigns stage hunk (visual)" })
        map("v", "<leader>hr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Gitsigns reset hunk (visual)" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns stage buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Gitsigns undo stage hunk" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns reset buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns preview hunk" })
        map("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { desc = "Gitsigns blame line" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Gitsigns toggle blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Gitsigns diff this" })
        map("n", "<leader>hD", function() gs.diffthis("~") end, { desc = "Gitsigns diff against HEAD" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Gitsigns toggle deleted" })
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
      end,
    }
  end,
}
