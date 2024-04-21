local conform = require("conform")

conform.setup({
  formatters_by_ft = {
    javascript = { "biome" },
    javascriptreact = { "biome" },
    typescript = { "biome" },
    typescriptreact = { "biome" },
    vue = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },

    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },

    go = { "goimports", "gofumpt" },
    python = { "isort", "black" },

    markdown = { "prettier" },
    ["markdown.mdx"] = { "prettier" },
    graphql = { "prettier" },

    rust = { "rustfmt" }
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  },
})

vim.keymap.set("n", "<C-f>", function()
  conform.format({
    lsp_fallback = true,
    async = false,
    timeout_ms = 1000,
  })
  vim.cmd([[ w ]])
  print("FORMATTED & FILE SAVED!")
end)
