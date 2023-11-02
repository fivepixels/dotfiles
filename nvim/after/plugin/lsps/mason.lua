local status_mason, mason = pcall(require, "mason")
local status_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")
if (not status_mason or not status_mason_lspconfig) then return end

mason.setup({

})

mason_lspconfig.setup({
  automatic_installation = true
})
