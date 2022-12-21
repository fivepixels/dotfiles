local vimOption = vim.opt

vim.cmd("autocmd!")

vim.scrptencoding = 'utf-8'
vimOption.encoding = 'utf-8'
vimOption.fileencoding = 'utf-8'

vim.wo.number = true
vimOption.nu = true
vimOption.relativenumber = true

vimOption.title = true
vimOption.autoindent = true
vimOption.smartindent = true
vimOption.hlsearch = true
vimOption.backup = false
vimOption.showcmd = true
vimOption.cmdheight = 1
vimOption.laststatus = 2
vimOption.expandtab = true
vimOption.scrolloff = 10
vimOption.shell = 'fish'
vimOption.backupskip = { '/tmp/*', '/private/tmp/*' }
vimOption.inccommand = 'split'
vimOption.ignorecase = true
vimOption.smarttab = true
vimOption.breakindent = true
vimOption.shiftwidth = 2
vimOption.softtabstop = 2
vimOption.tabstop = 2
vimOption.wrap = false
vimOption.swapfile = false
vimOption.backspace = { 'start', 'eol', 'indent' }
vimOption.path:append { '**' }
vimOption.wildignore:append { '*/node_modules/*' }
vimOption.expandtab = true
vimOption.undodir = os.getenv("HOME") .. "/.vim/undodir"
vimOption.undofile = true
vimOption.termguicolors = true
vimOption.scrolloff = 8
vimOption.signcolumn = "yes"
vimOption.isfname:append("@-@")
vimOption.updatetime = 50
vimOption.colorcolumn = "80"

vimOption.guicursor = ""
vim.g.mapleader = " "

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
});

vimOption.formatoptions:append { 'r' }
vim.opt.clipboard:append { 'unnamedplus' }
