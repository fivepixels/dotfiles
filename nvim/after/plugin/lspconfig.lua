local vim_protocol = require('vim.lsp.protocol')

vim_protocol.CompletionItemKind = {
  "󰉿", -- Text
  "󰆧", -- Method
  "󰊕", -- Function
  "", -- Constructor
  "󰜢", -- Field
  "󰀫", -- Variable
  "󰠱", -- Class
  "", -- Interface
  "", -- Module
  "󰜢", -- Property
  "󰑭", -- Unit
  "󰎠", -- Value
  "", -- Enum
  "󰌋", -- Keyword
  "", -- Snippet
  "󰏘", -- Color
  "󰈙", -- File
  "󰈇", -- Reference
  "󰉋", -- Folder
  "", -- EnumMember
  "󰏿", -- Constant
  "󰙅", -- Struct
  "", -- Event
  "󰆕", -- Operator
  '', -- TypeParameter
}

-- LSP styling
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = true,
    virtual_text = { spacing = 7, prefix = "\u{ea71}" },
    severity_sort = true,
  }
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "2" })
end

-- Configure VIM Diagnostic
vim.diagnostic.config({
  virtual_text = {
    prefix = '●'
  },
  update_in_insert = true,
  float = {
    source = "always",
  },
})
