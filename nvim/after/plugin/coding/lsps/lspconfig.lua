local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.diagnostic.config({
	diagnostics = {
		underline = false,
		update_in_insert = true,
		virtual_text = {
			spacing = 1,
			source = "if_many",
			prefix = "●",
		},
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = " ",
				[vim.diagnostic.severity.WARN] = "  ",
				[vim.diagnostic.severity.HINT] = " ",
				[vim.diagnostic.severity.INFO] = " ",
			},
		},
	},
	inlay_hints = {
		enabled = false,
	},
	codelens = {
		enabled = false,
	},
	capabilities = capabilities,
	format = {
		formatting_options = nil,
		timeout_ms = nil,
	},
})

vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

require("refactoring").setup({})
