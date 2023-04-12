local status, colors = pcall(require, "lsp-colors")
if (not status) then return end

-- https://github.com/folke/lsp-colors.nvim

colors.setup {
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
}
