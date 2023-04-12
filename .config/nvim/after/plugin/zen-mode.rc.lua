local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

-- https://github.com/folke/zen-mode.nvim


zenMode.setup { }

local keymap = vim.keymap
local opts = { silent = true }
keymap.set('n', '<C-z>', '<Cmd>ZenMode<CR>', opts)
