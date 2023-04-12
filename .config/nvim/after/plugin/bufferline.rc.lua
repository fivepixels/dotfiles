local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- https://github.com/akinsho/bufferline.nvim

bufferline.setup({
  options = {
    mode = "tabs",
    themable = false,
    numbers = "none",
    truncate_names = false,
    diagnostics = 'nvim_lsp',
    diagnostics_update_in_insert = true,
    color_icons = true,
    show_buffer_icons = true,
    show_close_icon = false,
    show_tab_indicators = true,
    show_buffer_close_icons = false,
    show_duplicate_prefix = false,
    separator_style = "thin",
    enforce_regular_tabs = true,
    always_show_bufferline = true,
    hover = {
      enabled = true,
    },
  },
  highlights = {
    separator = {
      fg = '#073642',
      bg = '#002b36',
    },
    separator_selected = {
      fg = '#073642',
    },
    background = {
      fg = '#657b83',
      bg = '#002b36'
    },
    buffer_selected = {
      fg = '#fdf6e3',
      bold = true,
    },
    fill = {
      bg = '#073642'
    }
  },})

local keymap = vim.keymap
local opts = {}

keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opts)
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)
keymap.set('n', 'tn', ':tabnew<Return>', opts)
keymap.set('n', 'tx', ':tabclose<Return>', opts)
