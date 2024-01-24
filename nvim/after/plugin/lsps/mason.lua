local status_mason, mason = pcall(require, "mason")
local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status_mason or not status_mason_lspconfig) then return end

mason.setup({
  max_concurrent_installers = 5,
  pip = {
    upgrade_pip = true,
  },
  ui = {
    border = true,
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
  },
})

mason_lspconfig.setup({
  automatic_installation = true,
})
