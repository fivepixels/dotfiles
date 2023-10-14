local status, onedark = pcall(require, 'onedark')
if (not status) then return end

-- https://github.com/folke/tokyonight.nvim

onedark.setup {
  style = 'deep',
  transparent = true,
}

require('onedark').load()
