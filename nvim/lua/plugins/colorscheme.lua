return {
	"craftzdog/solarized-osaka.nvim",
	lazy = true,
	priority = 1000,
	opts = {
		styles = {
			comments = { italic = true },
			keywords = { italic = true },
			functions = { italic = true, bold = true },
			variables = { italic = true, bold = true },
		},
		sidebars = { "qf", "vista_kind", "terminal", "packer" },
		hide_inactive_statusline = true,
		dim_inactive = true,
		lualine_bold = true,
	},
}
