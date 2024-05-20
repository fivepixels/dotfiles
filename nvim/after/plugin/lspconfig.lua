local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local map = vim.keymap.set
local tw = require("lspconfig.server_configurations.tailwindcss")

local opts = { noremap = true, silent = true }
local on_attach = function(_, bufnr)
	opts.buffer = bufnr

	map("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", opts)
	map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", opts)
	map("n", "<leader>lg", "<cmd>Lspsaga goto_definition<cr>", opts)
	map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", opts)
	map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", opts)
	map("n", "<leader>ll", "<cmd>LspRestart<cr>", opts)
	map({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<cr>", opts)

	map("n", "<C-k>", "<Cmd>Lspsaga hover_doc<CR>", opts)
	map("n", "<C-r>", "<Cmd>Lspsaga rename<CR>", opts)

	map("n", "<C-n>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	map("n", "<C-p>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
end

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- html
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- typescript
lspconfig["tsserver"].setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		opts.buffer = bufnr

		client.server_capabilities.document_formatting = false
		client.server_capabilities.document_range_formatting = false

		map("n", "<leader>to", "<cmd>TypescriptOrganizeImports<cr>", opts)
		map("n", "<leader>tr", "<cmd>TypescriptRenameFile<cr>", opts)

		on_attach(client, bufnr)
	end,
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
})

-- css
lspconfig["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- tailwindcss
lspconfig["tailwindcss"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = tw.default_config.filetypes,
})

-- svelte
lspconfig["svelte"].setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "*.js", "*.ts" },
			callback = function(ctx)
				if client.name == "svelte" then
					client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
				end
			end,
		})

		on_attach(client, bufnr)
	end,
})

-- prisma
lspconfig["prismals"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- graphql
lspconfig["graphql"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
})

-- python
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		map("n", "<leader>to", function()
			vim.lsp.buf.code_action({
				apply = true,
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
			})
		end)

		on_attach(client, bufnr)
	end,
})

-- lua
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		single_file_support = true,
		settings = {
			Lua = {
				workspace = {
					checkThirdParty = false,
				},
				completion = {
					workspaceWord = true,
					callSnippet = "Both",
				},
				misc = {
					parameters = {
						-- "--log-level=trace",
					},
				},
				hint = {
					enable = true,
					setType = false,
					paramType = true,
					paramName = "Disable",
					semicolon = "Disable",
					arrayIndex = "Disable",
				},
				doc = {
					privateName = { "^_" },
				},
				type = {
					castNumberToInteger = true,
				},
				diagnostics = {
					disable = { "incomplete-signature-doc", "trailing-space" },
					-- enable = false,
					groupSeverity = {
						strong = "Warning",
						strict = "Warning",
					},
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
				format = {
					enable = false,
					defaultConfig = {
						indent_style = "space",
						indent_size = "2",
						continuation_indent_size = "2",
					},
				},
			},
		},

		-- {
		-- Lua = {
		-- 	workspace = {
		-- 		checkThirdParty = false,
		-- 		{
		-- 			library = {
		-- 				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
		-- 				[vim.fn.stdpath("config") .. "/lua"] = true,
		-- 			},
		-- 		},
		-- 	},
		-- 	codeLens = { enable = true },
		-- 	completion = { workspaceWord = true, callSnippet = "Both" },
		-- 	hint = {
		-- 		enable = true,
		-- 		setType = false,
		-- 		paramType = true,
		-- 		paramName = "Disable",
		-- 		semicolon = "Disable",
		-- 		arrayIndex = "Disable",
		-- 	},
		-- 	doc = { privateName = { "^_" } },
		-- 	type = { castNumberToInteger = true },
		-- 	diagnostics = {
		-- 		globals = { "vim" },
		-- 		disable = { "incomplete-signature-doc", "trailing-space" },
		-- 		groupSeverity = { strong = "Warning", strict = "Warning" },
		-- 		groupFileStatus = {
		-- 			["ambiguity"] = "Opened",
		-- 			["await"] = "Opened",
		-- 			["codestyle"] = "None",
		-- 			["duplicate"] = "Opened",
		-- 			["global"] = "Opened",
		-- 			["luadoc"] = "Opened",
		-- 			["redefined"] = "Opened",
		-- 			["strict"] = "Opened",
		-- 			["strong"] = "Opened",
		-- 			["type-check"] = "Opened",
		-- 			["unbalanced"] = "Opened",
		-- 			["unused"] = "Opened",
		-- 		},
		-- 		unusedLocalExclude = { "_*" },
		-- 	},
		-- 	format = {
		-- 		defaultConfig = { indent_style = "space", indent_size = "2", continuation_indent_size = "2" },
		-- 	},
		-- },
		-- },
	},
})

lspconfig["jsonls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
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

lspconfig["yamlls"].setup({
	capabilities = {
		textDocument = {
			foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true,
			},
		},
	},
	on_attach = on_attach,
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

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics,
--   {
--     underline = true,
--     virtual_text = {
--       spacing = 2,
--       severity_limit = 'Warning',
--     },
--     update_in_insert = true,
--   }
-- )

lspconfig.biome.setup({})

map("n", "<leader>cp", "<cmd>MarkdownPreview<cr>")
lspconfig["marksman"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})
