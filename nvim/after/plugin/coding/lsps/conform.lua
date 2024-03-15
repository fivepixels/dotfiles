local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		go = { "goimports", "gofumpt" },
		python = { "black" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		vue = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		less = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		["markdown.mdx"] = { "prettier" },
		graphql = { "prettier" },
		handlebars = { "prettier" },
	},
	format_on_save = {
		timeout_ms = 1000,
		lsp_fallback = true,
	},
})

vim.keymap.set("n", "<leader>ff", function()
	conform.format({ formatters = { "injected" } })
end)
