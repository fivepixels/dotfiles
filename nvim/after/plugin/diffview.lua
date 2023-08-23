local status, diffview = pcall(require, "diffview")
if (not status) then return end

-- https://github.com/sindrets/diffview.nvim

-- Configure diffview
diffview.setup({})

-- Keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>")
keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>")
keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>")
keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>")
keymap.set("n", "<leader>dl", "<cmd>DiffviewLog<CR>")
