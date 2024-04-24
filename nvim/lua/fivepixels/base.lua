vim.cmd("autocmd!")

vim.mapleder = ' '
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.opt.title = true
vim.wo.number = true
vim.opt.mouse = ""
vim.wo.relativenumber = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.scrolloff = 15
vim.opt.wrap = false
vim.opt.laststatus = 2
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.backup = false
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.shell = 'fish'
vim.opt.guicursor = "n-v-c-sm:block,ve:ver25,r-o:hor20"

vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.opt.path:append { '**' }
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.formatoptions:append { 'r' }
vim.opt.clipboard:append { 'unnamedplus' }
vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/lazy.nvim")

vim.g.skip_ts_context_commentstring_module = true

if vim.g.neovide then
  vim.o.guifont = "Hack Nerd Font Mono"
  local transparency = 0.5
  vim.g.neovide_transparency = transparency
  vim.g.transparency = transparency
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 5.0
  vim.g.neovide_floating_blur_amount_y = 5.0
  vim.g.neovide_scale_factor = 1.35
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 1
  vim.g.neovide_no_idle = false
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
