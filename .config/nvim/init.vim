autocmd!
scriptencoding utf-8
if !1 | finish | endif

syntax enable
set nocompatible
set t_BE=
set mat=2
set number
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set nobackup
set hlsearch
set showcmd
set cmdheight=1
set laststatus=2
set scrolloff=10
set expandtab
set shell=fish
set backupskip=/tmp/*,/private/tmp/*
set clipboard+=unnamedplus
set inccommand=split
set nosc noru nosm
set lazyredraw
set ignorecase
set smarttab
set shiftwidth=2
set tabstop=2
set ai
set si
set nowrap
set backspace=start,eol,indent
set path+=**
set wildignore+=*/node_modules/*
set formatoptions+=r
set cursorline
set exrc
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
set background=dark
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md

let loaded_matchparen = 1
let s:uname = system("uname -s")
let g:neosolarized_termtrans=1

autocmd InsertLeave * set nopaste
autocmd VimEnter * :NERDTreeToggle
autocmd VimEnter * :source ~/.config/nvim/init.vim
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

au BufNewFile,BufRead *.es6 setf javascript
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
au BufNewFile,BufRead *.flow set filetype=javascript
au BufNewFile,BufRead *.fish set filetype=fish

runtime ./plug.vim
runtime ./maps.vim
runtime ./macos.vim
runtime ./colors/NeoSolarized.vim

colorscheme NeoSolarized
