local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = "typescript"
  }
}

-- the keymaps were moved to ./lspconfig.lua file.
