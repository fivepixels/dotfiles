local status, null_ls = pcall(require, "null-ls")
if (not status) then
  print('Null ls is not installed.')
  return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

null_ls.setup {
  sources = {
    -- Code Actions
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.gomodifytags,
    null_ls.builtins.code_actions.proselint,

    -- Completion
    null_ls.builtins.completion.spell,

    -- Diagnostics
    null_ls.builtins.diagnostics.actionlint,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.commitlint,
    null_ls.builtins.diagnostics.dotenv_linter,
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.diagnostics.fish,
    null_ls.builtins.diagnostics.tsc,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.sqlfluff,
    null_ls.builtins.diagnostics.puglint,
    null_ls.builtins.diagnostics.stylint,

    -- Formatting
    null_ls.builtins.formatting.autoflake,
    null_ls.builtins.formatting.dart_format,
    null_ls.builtins.formatting.djhtml,
    null_ls.builtins.formatting.djlint,
    null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.fish_indent,
    null_ls.builtins.formatting.fixjson,
    null_ls.builtins.formatting.pg_format,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.prettier_d_slim,
    null_ls.builtins.formatting.prettier_eslint,
    null_ls.builtins.formatting.sqlfluff,
    null_ls.builtins.formatting.stylelint,
    null_ls.builtins.formatting.prismaFmt,
    null_ls.builtins.formatting.eslint_d,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end
}

vim.api.nvim_create_user_command(
  'DisableLspFormatting',
  function()
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
  end,
  { nargs = 0 }
)
