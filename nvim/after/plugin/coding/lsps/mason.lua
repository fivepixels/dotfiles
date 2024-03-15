local mason = require("mason")
local mason_lsp = require("mason-lspconfig")

mason.setup({
	max_concurrent_installers = 5,
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lsp.setup({
	ensure_installed = {
		"astro",
		"bashls",
		-- "black",
		-- "codelldb", Why is'n it a valid value for ensure_installed?
		"clangd",
		"cssls",
		"cssmodules_ls",
		"diagnosticls",
		"dockerls",
		"dotls",
		"eslint",
		-- "goimports",
		-- "gofumpt",
		-- "gomodifytags",
		-- "impl",
		"grammarly",
		"graphql",
		"html",
		"jsonls",
		"tsserver",
		"lua_ls",
		"marksman",
		-- "markdownlint",
		"prismals",
		-- "prettier",
		"pyright",
		"rust_analyzer",
		"sqlls",
		"svelte",
		"taplo",
		"tailwindcss",
		"lemminx",
		"yamlls",
	},
})

-- :MasonInstall codelldb goimports gofumpt gomodifytags impl markdownlint prettier
