autocmd!
scriptencoding utf-8
if !1 | finish | endif
syntax enable

set nocompatible
set number
set relativenumber
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
set scrolloff=15
set expandtab
set shell=fish
set backupskip=/tmp/*,/private/tmp/*
set nosc noru nosm
set lazyredraw
set showmatch
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
set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md
set clipboard+=unnamedplus
set t_BE=

runtime ./plug.vim
runtime ./maps.vim

if has('nvim')
  set inccommand=split
endif

autocmd InsertLeave * set nopaste
autocmd VimEnter * :NERDTree
autocmd VimEnter * :source ~/.dotfiles/.config/nvim/init.vim
autocmd VimEnter * :AirlineTheme base16

command! -nargs=0 Prettier :call CocAction("runCommand", "prettier.formatFile")

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
au BufNewFile,BufRead *.js setf javascript
au BufNewFile,BufRead *.jsx setf javascriptreact
au BufNewFile,BufRead *.tsx setf typescriptreact
au BufNewFile,BufRead *.md set filetype=markdown
au BufNewFile,BufRead *.mdx set filetype=markdown
au BufNewFile,BufRead *.flow set filetype=javascript
au BufNewFile,BufRead *.fish set filetype=fish

autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2

autocmd VimEnter * :source ~/.config/nvim/after/plugin/autopairs.rc.lua
autocmd VimEnter * :source ~/.config/nvim/after/plugin/cmp.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/defx.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/fugitive.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/lsp-colors.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/lsp-installer.lua
autocmd VimEnter * :source ~/.config/nvim/after/plugin/lspconfig.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/lspkind.rc.lua
autocmd VimEnter * :source ~/.config/nvim/after/plugin/lspsaga.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/lualine.rc.lua
autocmd VimEnter * :source ~/.config/nvim/after/plugin/tabline.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/telescope.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/treesitter.rc.vim
autocmd VimEnter * :source ~/.config/nvim/after/plugin/ts-autotag.rc.lua
autocmd VimEnter * :source ~/.config/nvim/after/plugin/web-devicons.rc.vim

syntax enable
set termguicolors
set winblend=0
set wildoptions=pum
set pumblend=5
set background=dark
let g:neosolarized_termtrans=1
colorscheme NeoSolarized
runtime ./colors/NeoSolarized.vim
