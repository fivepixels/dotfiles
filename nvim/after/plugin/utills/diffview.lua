local status, diffview = pcall(require, "diffview")
if (not status) then return end

-- https://github.com/sindrets/diffview.nvim

-- Configure diffview
diffview.setup({})

-- Keymaps
local keymap = vim.keymap

local nmap = function(keys, func, desc)
  if desc then
    desc = 'Diffview: ' .. desc
  end

  keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
end


nmap('<leader>do', '<cmd>DiffviewOpen<CR>', '[D]iffview [O]pen')
nmap('<leader>dc', '<cmd>DiffviewClose<CR>', '[D]iffview [C]lose')
nmap('<leader>dr', '<cmd>DiffviewRefresh<CR>', '[D]iffview [R]efresh')
nmap('<leader>dh', '<cmd>DiffviewFileHistory<CR>', '[D]iffview File [H]istory')
