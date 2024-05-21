local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
local tw = require("lspconfig.server_configurations.tailwindcss")
local map = vim.keymap.set

local on_attach = function(_, bufnr)
  local current_opts = { noremap = true, silent = true, buffer = bufnr }

  local use_opts = function(desc)
    return vim.tbl_extend("force", current_opts, { desc = desc })
  end

  map("n", "<leader>lf", "<cmd>Lspsaga finder<cr>", use_opts("Open the finder"))
  map("n", "<leader>lp", "<cmd>Lspsaga peek_definition<cr>", use_opts("Edit on the floating window"))
  map("n", "<leader>lg", "<cmd>Lspsaga goto_definition<cr>", use_opts("Go to the definition"))
  map("n", "<leader>lo", "<cmd>Lspsaga outline<cr>", use_opts("See the list of outline"))
  map("n", "<leader>lr", "<cmd>Lspsaga rename<cr>", use_opts("Rename"))
  map("n", "<leader>ll", "<cmd>LspRestart<cr>", use_opts("Restart the LSP"))
  map("n", "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>", use_opts("See simple documents"))
  map({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<cr>", use_opts("See code actions"))

  map("n", "<C-n>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", current_opts)
  map("n", "<C-p>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", current_opts)
end

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local basicLspSetup = {
  capabilities = capabilities,
  on_attach = on_attach,
}

lspconfig["asm_lsp"].setup(basicLspSetup)

-- WEB/APP
lspconfig["html"].setup(basicLspSetup)
lspconfig["htmx"].setup(basicLspSetup)
lspconfig["cssls"].setup(basicLspSetup)
lspconfig["cssmodules_ls"].setup(basicLspSetup)
lspconfig["css_variables"].setup(basicLspSetup)
lspconfig["somesass_ls"].setup(basicLspSetup)
lspconfig["biome"].setup(basicLspSetup)
lspconfig["astro"].setup(basicLspSetup)

-- Bash
lspconfig["bashls"].setup(basicLspSetup)

-- C/C++/C#/Swift
lspconfig["sourcekit"].setup(basicLspSetup)
lspconfig["ccls"].setup(basicLspSetup)

-- Dart
lspconfig["dartls"].setup(basicLspSetup)

-- Go
-- lspconfig["golangci_lint_ls"].setup(basicLspSetup)
-- lspconfig["gopls"].setup(basicLspSetup)

-- Docker
lspconfig["dockerls"].setup(basicLspSetup)

-- SQLs/ORMs
lspconfig["graphql"].setup(basicLspSetup)
lspconfig["postgres_lsp"].setup(basicLspSetup)
lspconfig["prismals"].setup(basicLspSetup)
-- lspconfig["sqls"].setup(basicLspSetup)

-- Nvim
lspconfig["lua_ls"].setup(basicLspSetup)
lspconfig["vimls"].setup(basicLspSetup)

-- md
-- lspconfig["marksman"].setup(basicLspSetup)

-- python
lspconfig["pyright"].setup(basicLspSetup)
lspconfig["mojo"].setup(basicLspSetup)

-- Rust
lspconfig["rust_analyzer"].setup(basicLspSetup)

-- WGSL Shading Langugae
lspconfig["wgsl_analyzer"].setup(basicLspSetup)

-- Zig
lspconfig["zls"].setup(basicLspSetup)

-- JSON/YAML
lspconfig["jsonls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  },
})

lspconfig["yamlls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

-- typescript
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
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
require("nvim-ts-autotag").setup({})
