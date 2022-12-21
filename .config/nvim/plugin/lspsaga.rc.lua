local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.init_lsp_saga {
  server_filetype_map = {
    typescript = "typescript"
  }
}

local opts = { noremap = true, silent = true }
local keymap = vim.keymap

keymap.set('n', '<C-n>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', '<C-p>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
keymap.set('n', '<leader>lh', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', '<leader>lf', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('n', '<leader>lq', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', '<leader>lr', '<Cmd>Lspsaga rename<CR>', opts)
