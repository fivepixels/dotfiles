vim.cmd("autocmd!")

-- <leader>
vim.mapleader = ' '
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Endcoding
vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Mouse and Cursor
vim.opt.mouse = ""
vim.keymap.set({ "", "i" }, "<up>", "<nop>")
vim.keymap.set({ "", "i" }, "<down>", "<nop>")
vim.opt.guicursor = "n-v-c-sm:block,ve:ver25,r-o:hor20"

-- Number
vim.wo.number = true
vim.wo.relativenumber = true

-- Default
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.scrolloff = 15
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.backup = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.shell = 'fish'

vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Copy and Past
vim.opt.formatoptions:append { 'r' }
vim.opt.clipboard:append { 'unnamedplus' }
