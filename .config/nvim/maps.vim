" Description: Keymaps

nnoremap <S-C-p> "0p
nnoremap <leader>d "_d
nnoremap x "_x

nnoremap + <C-a>
nnoremap - <C-x>

nnoremap dw vb"_d

nmap <C-a> gg<S-v>G

command! W w !sudo tee > /dev/null %

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

nmap <Space> <C-w>w
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
map su :w<Return>
map s= <C-w>=
map sp <C-w>q

nmap s<left> <C-w><
nmap s<right> <C-w>>
nmap s<up> <C-w>+
nmap s<down> <C-w>-


" Coc Config "{{{
" ---------------------------------------------------------------------

" show commit contains current position
nmap ci <Plug>(coc-git-commit)

nmap cS :CocCommand git.showCommit
nmap cB :CocCommand git.browserOpen
nmap cP :CocCommand git.push

let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_open_to_the_world = 0
let g:mkdp_port = '9341'
let g:mkdp_echo_preview_url = 1
let g:mkdp_page_title = 'MP | ${name}'

nmap <silent> mp <Plug>MarkdownPreview
nmap <silent> ms <Plug>MarkdownPreviewStop
nmap <silent> mt <Plug>MarkdownPreviewToggle

autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

autocmd FileType go nmap gtj :CocCommand go.tags.add json<cr>
autocmd FileType go nmap gty :CocCommand go.tags.add yaml<cr>
autocmd FileType go nmap gtx :CocCommand go.tags.clear<cr>

imap <C-l> <Plug>(coc-snippets-expand)

vmap <C-j> <Plug>(coc-snippets-select)

let g:coc_snippet_next = '<c-r>'
let g:coc_snippet_prev = '<c-t>'

imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)

"}}}
