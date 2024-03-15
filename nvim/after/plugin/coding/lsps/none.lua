local none = require("null-ls")

none.setup({
	root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".git"),
	method = none.methods.DIAGNOSTICS,
	sources = {
		none.builtins.code_actions.gitsigns,
		none.builtins.code_actions.refactoring,
		none.builtins.code_actions.ts_node_action,
		none.builtins.code_actions.gomodifytags,
		none.builtins.code_actions.impl,

		none.builtins.completion.luasnip,
		none.builtins.completion.spell,
		none.builtins.completion.tags,
		none.builtins.completion.vsnip,

		none.builtins.diagnostics.actionlint,
		none.builtins.diagnostics.commitlint,
		none.builtins.diagnostics.cppcheck,
		none.builtins.diagnostics.djlint,
		none.builtins.diagnostics.dotenv_linter,
		none.builtins.diagnostics.fish,
		none.builtins.diagnostics.gitlint,
		none.builtins.diagnostics.golangci_lint,
		none.builtins.diagnostics.markdownlint,
		-- none.builtins.diagnostics.mdl,
		none.builtins.diagnostics.mypy,
		none.builtins.diagnostics.npm_groovy_lint,
		none.builtins.diagnostics.pylint.with({
			diagnostics_postprocess = function(diagnostic)
				diagnostic.code = diagnostic.message_id
			end,
		}),
		none.builtins.diagnostics.revive,
		none.builtins.diagnostics.spectral,
		none.builtins.diagnostics.sqlfluff,
		none.builtins.diagnostics.staticcheck,
		none.builtins.diagnostics.stylelint,
		none.builtins.diagnostics.stylint,
		none.builtins.diagnostics.vint,
		none.builtins.diagnostics.yamllint,
		none.builtins.diagnostics.zsh,

		none.builtins.formatting.asmfmt,
		none.builtins.formatting.biome,
		none.builtins.formatting.black,
		none.builtins.formatting.dart_format,
		none.builtins.formatting.djhtml,
		none.builtins.formatting.djlint,
		none.builtins.formatting.fish_indent,
		none.builtins.formatting.gofmt,
		none.builtins.formatting.goimports,
		none.builtins.formatting.gofumpt,
		none.builtins.formatting.isort,
		none.builtins.formatting.markdownlint,
		none.builtins.formatting.mdformat,
		none.builtins.formatting.pg_format,
		none.builtins.formatting.prettier,
		none.builtins.formatting.prettierd,
		none.builtins.formatting.pyink,
		none.builtins.formatting.sqlfluff,
		none.builtins.formatting.sqlfmt,
		none.builtins.formatting.stylelint,
		none.builtins.formatting.stylua,
		none.builtins.formatting.yamlfix,

		none.builtins.hover.dictionary,
	},
})
