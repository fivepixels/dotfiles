local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
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
