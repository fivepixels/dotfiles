local status, tokyonight = pcall(require, 'tokyonight')
if (not status) then return end

-- https://github.com/folke/tokyonight.nvim

-- Configure Tokyonight Theme
tokyonight.setup({
  style = "night",
})

-- Apply the theme
vim.cmd [[colorscheme tokyonight]]
