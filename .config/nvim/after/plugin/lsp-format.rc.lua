local status_lsp_format, lsp_format = pcall(require, "lsp-format")
local status_lspconfig, lspconfig = pcall(require, "lsp-config")
if (not status_lsp_format) then return end
if (not status_lspconfig) then return end

lsp_format.setup {
  typescript = { tab_width = 2 },
  yaml = { tab_width = 2 },
}

local prettier = {
  formatCommand = [[prettier --stdin-filepath ${INPUT} ${--tab-width:tab_width}]],
  formatStdin = true,
}

lspconfig.efm.setup {
  on_attach = lsp_format.on_attach,
  init_options = { documentFormatting = true },
  settings = {
    languages = {
      typescript = { prettier },
      yaml = { prettier },
    },
  },
}
