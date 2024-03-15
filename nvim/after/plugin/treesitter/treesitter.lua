local treesitter = require("nvim-treesitter")

treesitter.setup({
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
		"bash",
		"c",
		"diff",
		"go",
		"gomod",
		"gowork",
		"gosum",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"jsonc",
		"json5",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"ninja",
		"python",
		"query",
		"regex",
		"rst",
		"ron",
		"rust",
		"toml",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"xml",
		"yaml",
	},
})