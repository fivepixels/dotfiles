local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({
  max_concurrent_installers = 5,
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗",
    },
  },
})

mason_lsp.setup({
  ensure_installed = {
    "astro",
    "bashls",
    "clangd",
    "cssls",
    "cssmodules_ls",
    "diagnosticls",
    "dockerls",
    "dotls",
    "eslint",
    "grammarly",
    "graphql",
    "html",
    "jsonls",
    "tsserver",
    "lua_ls",
    "marksman",
    "prismals",
    "pyright",
    "rust_analyzer",
    "sqlls",
    "svelte",
    "taplo",
    "tailwindcss",
    "lemminx",
    "yamlls",
  },
  automatic_installation = true,
})

-- MasonInstall isort black pylint eslint_d prettier stylua
