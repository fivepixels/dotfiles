local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
  backdrop = 0.64,
  signcolumn = "yes",
  number = true,
  relativenumber = true,
  cursorline = true,
  cursorcolumn = true,
}

vim.keymap.set('n', '<C-w>o', '<cmd>ZenMode<CR>', { silent = true })
