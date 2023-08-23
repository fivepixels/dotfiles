local status, diffview = pcall(require, "diffview")
if (not status) then return end

-- https://github.com/sindrets/diffview.nvim

diffview.setup({})

-- Set Keymap
vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>", { desc = "Diffview: [D]iffview Window [O]pen" })
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>", { desc = "Diffview: [D]iffview Window [C]lose" })
vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>", { desc = "Diffview: [D]iffview Window [R]efresh" })
vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>", { desc = "Diffview: [D]iffview File [H]istory" })
vim.keymap.set("n", "<leader>dl", "<cmd>DiffviewLog<CR>", { desc = "Diffview: [D]iffview [L]og" })
