vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.autoformat = true
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local opt = vim.opt
opt.title = true
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.smartindent = true
opt.smarttab = true
opt.breakindent = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.hlsearch = true
opt.backup = false
opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 3
opt.expandtab = true
opt.scrolloff = 15
opt.shell = "fish"
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.inccommand = "split"
opt.ignorecase = true
opt.wrap = false
opt.backspace = { "start", "eol", "indent" }
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "cursor"
opt.mouse = ""
opt.guicursor = "n-v-c-sm:block,ve:ver25,r-o:hor20"
opt.path:append({ "**" })
opt.wildignore:append({ "*/node_modules/*" })
opt.clipboard:append { 'unnamedplus' }
opt.formatoptions:append({ "r", "jcroqlnt" })

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

