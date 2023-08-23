local status, which = pcall(require, "which-key")
if (not status) then return end

-- https://github.com/folke/which-key.nvim

vim.o.timeout = true
vim.o.timeoutlen = 500

which.register({})
