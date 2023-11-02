local status, colorizer = pcall(require, "colorizer")
if (not status) then return end

-- https://github.com/norcalli/nvim-colorizer.lua

-- Configure colorizer
colorizer.setup({
  '*';
})
