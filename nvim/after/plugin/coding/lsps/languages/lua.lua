local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({
	single_file_support = true,
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			codeLens = { enable = true },
			completion = { workspaceWord = true, callSnippet = "Both" },
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = "Disable",
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
			doc = { privateName = { "^_" } },
			type = { castNumberToInteger = true },
			diagnostics = {
				globals = { "vim" },
				disable = { "incomplete-signature-doc", "trailing-space" },
				groupSeverity = { strong = "Warning", strict = "Warning" },
				groupFileStatus = {
					["ambiguity"] = "Opened",
					["await"] = "Opened",
					["codestyle"] = "None",
					["duplicate"] = "Opened",
					["global"] = "Opened",
					["luadoc"] = "Opened",
					["redefined"] = "Opened",
					["strict"] = "Opened",
					["strong"] = "Opened",
					["type-check"] = "Opened",
					["unbalanced"] = "Opened",
					["unused"] = "Opened",
				},
				unusedLocalExclude = { "_*" },
			},
			format = { defaultConfig = { indent_style = "space", indent_size = "2", continuation_indent_size = "2" } },
		},
	},
})
