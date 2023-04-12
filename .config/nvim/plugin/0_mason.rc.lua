local status, mason = pcall(require, "mason")
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status) then return end
if (not status2) then return end

-- https://github.com/williamboman/mason.nvim
-- https://github.com/williamboman/mason-lspconfig.nvim

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
  keymaps = {
    uninstall_package = "<C-d>"
  }
})

lspconfig.setup({
  ensure_installed = {
    "astro",
    "cssls",
    "cssmodules_ls", 
    "unocss", 
    "dotls", 
    "eslint", 
    "grammarly", 
    "html", 
    "jsonls", 
    "tsserver", 
    "lua_ls", 
    "marksman", 
    "prismals", 
    "tailwindcss", 
    "lemminx", 
    "yamlls", 
  },
  automatic_installations = true,
})
