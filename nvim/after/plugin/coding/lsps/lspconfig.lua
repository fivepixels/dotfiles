local lspconfig = require("lspconfig")
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

lspconfig.html.setup({
	capabilities = capabilities,
})
lspconfig.htmx.setup({
	capabilities = capabilities,
})

lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "<leader>to", function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
			})
		end)
	end,
})
lspconfig.ruff_lsp.setup({
	capabilities = capabilities,
	on_attach = function(client, _)
		if client.name == "ruff_lsp" then
			client.server_capabilities.hoverProvider = false
		end
	end,
})

lspconfig.gopls.setup({
	capabilities = capabilities,
	on_attach = function()
		if client.name == "gopls" then
			if not client.server_capabilities.semanticTokensProvider then
				local semantic = client.config.capabilities.textDocument.semanticTokens
				client.server_capabilities.semanticTokensProvider = {
					full = true,
					legend = {
						tokenTypes = semantic.tokenTypes,
						tokenModifiers = semantic.tokenModifiers,
					},
					range = true,
				}
			end
		end
	end,
	settings = {
		gopls = {
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				fieldalignment = true,
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
			semanticTokens = true,
		},
	},
})

lspconfig.marksman.setup({
	capabilities = capabilities,
})
lspconfig.yamlls.setup({

	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
	-- lazy-load schemastore when needed
	on_new_config = function(new_config)
		new_config.settings.yaml.schemas =
			vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
	end,
	settings = {
		redhat = { telemetry = { enabled = false } },
		yaml = {
			keyOrdering = false,
			schemaStore = {
				enable = false,
				url = "",
			},
			validate = true,
			schemas = require("schemastore").yaml.schemas(),
		},
	},
})
lspconfig.jsonls.setup({
	capabilities = capabilities,
	on_new_config = function(new_config)
		new_config.settings.json.schemas = new_config.settings.json.schemas or {}
		vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
	end,
	settings = {
		json = {
			format = {
				enable = true,
			},
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
})

lspconfig.tailwindcss.setup({
	capabilities = capabilities,
	filetypes_exclude = { "markdown" },
	filetypes_include = {},
	on_attach = function()
		local tw = require("lspconfig.server_configurations.tailwindcss")
		opts.filetypes = opts.filetypes or {}

		vim.list_extend(opts.filetypes, tw.default_config.filetypes)

		opts.filetypes = vim.tbl_filter(function(ft)
			return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
		end, opts.filetypes)

		-- Add additional filetypes
		vim.list_extend(opts.filetypes, opts.filetypes_include or {})
	end,
})

lspconfig.tsserver.setup({
	root_dir = require("null-ls.utils").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
	capabilities = capabilities,
	single_file_support = false,
	settings = {
		completion = {
			completeFunctionCalls = true,
		},
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "literal",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
	on_attach = function(client, _)
		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		vim.keymap.set("n", "<leader>to", "<cmd>TypescriptOrganizeImports<cr>")
		vim.keymap.set("n", "<leader>tr", "<cmd>TypescriptRenameFile<cr>")
	end,
})
lspconfig.lua_ls.setup({
	capabilities = capabilities,
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
lspconfig.html.setup({
	capabilities = capabilities,
})

lspconfig.eslint.setup({
	capabilities = capabilities,
	settings = {
		workingDirectories = { mode = "auto" },
	},
})

require("crates").setup({
	src = {
		cmp = { enabled = true },
	},
})

vim.keymap.set("n", "<leader>p", "<cmd>MarkdownPreviewToggle<cr>")

require("refactoring").setup({})

require("ts-node-action").setup({})

-- lspconfig.rust_analyzer.setup({})
-- https://github.com/mrcjkb/rustaceanvim#usage
-- require("rustaceanvim").setup({
--   server = {
--     on_attach = function(_, bufnr)
--       vim.keymap.set("n", "<leader>cR", function()
--         vim.cmd.RustLsp("codeAction")
--       end, { desc = "Code Action", buffer = bufnr })
--       vim.keymap.set("n", "<leader>dr", function()
--         vim.cmd.RustLsp("debuggables")
--       end, { desc = "Rust debuggables", buffer = bufnr })
--     end,
--
--     default_settings = {
--       -- rust-analyzer language server configuration
--       ["rust-analyzer"] = {
--         cargo = {
--           allFeatures = true,
--           loadOutDirsFromCheck = true,
--           runBuildScripts = true,
--         },
--         -- Add clippy lints for Rust.
--         checkOnSave = {
--           allFeatures = true,
--           command = "clippy",
--           extraArgs = { "--no-deps" },
--         },
--         procMacro = {
--           enable = true,
--           ignored = {
--             ["async-trait"] = { "async_trait" },
--             ["napi-derive"] = { "napi" },
--             ["async-recursion"] = { "async_recursion" },
--           },
--         },
--       },
--     },
--   },
-- })
