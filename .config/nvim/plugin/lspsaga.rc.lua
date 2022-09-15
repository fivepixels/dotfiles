local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = 'typescript'
  }
}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set('n', 'gf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
keymap.set('n', 'gh', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', 'gs', '<Cmd>Lspsaga signature_help<CR>', opts)
keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
keymap.set('n', 'gi', '<Cmd>Lspsaga implement<CR>', opts)
keymap.set('n', 'go', '<Cmd>Lspsaga code_action<CR>', opts)
keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', '<C-p>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
