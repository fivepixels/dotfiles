local gitsigns = require("gitsigns")
local diffview = require("diffview")

gitsigns.setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "" },
		topdelete = { text = "" },
		changedelete = { text = "▎" },
		untracked = { text = "▎" },
	},
	current_line_blame = true,
	current_line_blame_formatter = "[<author>] | [<author_time:%Y-%m-%d>] | [<summary>]",
	max_file_length = 5000,
})

diffview.setup({})

vim.keymap.set("n", "<leader>do", "<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>DiffviewClose<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>DiffviewRefresh<CR>")
vim.keymap.set("n", "<leader>dh", "<cmd>DiffviewFileHistory<CR>")
vim.keymap.set("n", "<leader>dl", "<cmd>DiffviewLog<CR>")
