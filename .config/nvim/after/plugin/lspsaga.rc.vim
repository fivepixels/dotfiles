if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
  code_action_prompt = {
    enable = false
  }
}

EOF

nnoremap <silent>K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent>gf <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent>gp <Cmd>Lspsaga preview_definition<CR>
nnoremap <silent>gr <Cmd>Lspsaga rename<CR>

nnoremap <silent>gj <Cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent>gk <Cmd>Lspsaga diagnostic_jump_next<CR>
