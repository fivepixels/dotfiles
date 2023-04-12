local status, gitsigns = pcall(require, "gitsigns")
if (not status) then return end

-- https://github.com/lewis6991/gitsigns.nvim

gitsigns.setup { }
