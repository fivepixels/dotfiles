return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSInstall all",
		opts = {
			ensure_installed = {
				-- languages
				"html",
				"pug",
				"htmldjango",
				"css",
				"scss",
				"javascript",
				"typescript",
				"tsx",
				"dart",
				"astro",
				"svelte",
				"python",
				"rust",
				"ruby",
				"swift",
				"go",
				"dot",
				"lua",
				"luadoc",
				"vim",
				"vimdoc",

				-- sqls
				"sql",
				"graphql",

				-- bashes
				"fish",
				"bash",

				-- datas
				"xml",
				"yaml",
				"toml",
				"csv",
				"json",
				"json5",

				"markdown",

				-- git
				"gitcommit",
				"gitignore",
				"git_config",
				"git_rebase",
				"gitattributes",
				"diff",
			},
		},

		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)

			vim.filetype.add({
				extension = {
					mdx = "mdx",
				},
			})

			vim.treesitter.language.register("markdown", "mdx")
		end,
	},
}
