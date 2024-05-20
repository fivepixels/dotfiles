local diffview = require("diffview")

diffview.setup({})

vim.keymap.set("n", "<leader>dp", "<cmd>DiffviewOpen<cr>")
