local lint = require("lint")

lint.events = { "BufWritePost", "BufReadPost", "InsertLeave" }

lint.linters_by_ft = {
	javascript = { "biomejs" },
	typescript = { "biomejs" },
	javascriptreact = { "biomejs" },
	typescriptreact = { "biomejs" },
	svelte = { "eslint" },
	markdown = { "markdownlint" },
	python = { "pylint" },
}
