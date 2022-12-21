local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "masone-lspconfig")
if (not status2) then return end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

lspconfig.setup {
  ensure_installed = {
    "astro",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "dotls",
    "eslint",
    "golangci_lint_ls",
    "gopls",
    "grammarly",
    "graphql",
    "html",
    "jsonls",
    "quick_lint_ls",
    "kotlin_language_server",
    "sumneko_lua",
    "marksman",
    "prismals",
    "pyright",
    "r_language_server",
    "rust_analyzer",
    "sqlls",
    "sqls",
    "svelte",
    "taplo",
    "tailwindcss",
    "tsserver",
    "leminx",
    "yamlls",
  },
  automatic_installation = true
}

lspconfig.setup_handlers({
  function(server_name)
    require('lspconfig')[server_name].setup {}
  end,
  ["sumneko_lua"] = function()
    lspconfig.sumneko_lua.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,
})
