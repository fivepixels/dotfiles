local status, lspkind = pcall(require, "lspkind")
if (not status) then return end

lspkind.init({
  -- enables text annotations
  --
  -- default: true
  mode = 'symbol',

  -- default symbol map
  -- can be either 'default' (requires nerd-fonts font) or
  -- 'codicons' for codicon preset (requires vscode-codicons font)
  --
  -- default: 'default'
  preset = 'codicons',

  -- override preset symbols
  --
  -- default: {}
  symbol_map = {
    Text = " (Text)",
    Method = " (Method)",
    Function = " (Function)",
    Constructor = " (Constructor)",
    Field = "ﰠ (Field)",
    Variable = " (Variable)",
    Class = "ﴯ (Class)",
    Interface = " (Interface)",
    Module = " (Module)",
    Property = "ﰠ (Property)",
    Unit = "塞 (Unit)",
    Value = " (Value)",
    Enum = " (Enum)",
    Keyword = " (Keyword)",
    Snippet = " (Snippet)",
    Color = " (Color)",
    File = " (File)",
    Reference = " (Reference)",
    Folder = " (Folder)",
    EnumMember = " (EnumMember)",
    Constant = " (Constant)",
    Struct = "פּ (Struct)",
    Event = " (Event)",
    Operator = " (Operator)",
    TypeParameter = " (TypeParameter)"
  },
})
