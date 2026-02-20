return {
  "williamboman/mason.nvim",
  lazy = false,
  opts = function()
    return {
      servers = {
        "typescript-language-server",
        "lua-language-server",
        "bash-language-server",
        "docker-compose-language-service",
        "pyright",
        "rust-analyzer",
        "gopls",
      },
      tools = { "eslint_d", "prettierd", "stylua" },
    }
  end,
  config = function(_, opts)
    local mason = require("mason")
    local registry = require("mason-registry")
    mason.setup()
    local function ensure_installed(list)
      for _, name in ipairs(list) do
        local p = registry.get_package(name)
        if not p:is_installed() then
          vim.schedule(function() print("[Mason] Installing " .. name) end)
          p:once("install:success", function() vim.schedule(function() print("[Mason] Installed " .. name) end) end)
          p:once("install:failed", function() vim.schedule(function() print("[Mason] Failed " .. name) end) end)
          p:install()
        end
      end
    end
    ensure_installed(opts.servers)
    ensure_installed(opts.tools)
  end,
}
