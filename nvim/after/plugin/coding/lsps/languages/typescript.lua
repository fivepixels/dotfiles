local lspconfig = require("lspconfig")

lspconfig.tsserver.setup({
  root_dir = require("null-ls.utils").root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
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

lspconfig.tailwindcss.setup({
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

lspconfig.html.setup({})

lspconfig.htmx.setup({})

lspconfig.eslint.setup({
  settings = {
    workingDirectories = { mode = "auto" },
  },
})

require("ts-node-action").setup({})
