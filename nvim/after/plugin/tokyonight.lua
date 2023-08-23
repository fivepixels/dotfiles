local status, tokyonight = pcall(require, 'tokyonight')
if (not status) then return end

-- https://github.com/folke/tokyonight.nvim

tokyonight.setup({
  style = "night"
})

vim.cmd[[colorscheme tokyonight]]
