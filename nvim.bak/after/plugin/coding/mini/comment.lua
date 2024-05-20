local comment = require("mini.comment")
local ts_context = require("ts_context_commentstring")
local todo = require("todo-comments")

comment.setup({
	options = {
		custom_commentstring = function()
			return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
		end,
	},
})

todo.setup({})

ts_context.setup({
	enable_autocmd = false,
})

vim.keymap.set("n", "<leader>mn", function()
	todo.jump_next()
end)
vim.keymap.set("n", "<leader>mp", function()
	todo.jump_prev()
end)
vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
