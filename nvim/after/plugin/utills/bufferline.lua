local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

-- https://github.com/akinsho/bufferline.nvim

-- Configure Bufferline
bufferline.setup({
  options = {
    mode = "tabs",
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
    separator_style = "slant",
    enforce_regular_tabs = false,
    always_show_bufferline = true,
    hover = {
      enabled = true,
    },
  },
})

-- Keymaps
local keymap = vim.keymap

-- Switch between tabs
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>')   -- Left
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>') -- Right

-- Create and Remove tabs
keymap.set('n', 'tn', ':tabnew<Return>')   -- Create
keymap.set('n', 'tx', ':tabclose<Return>') -- Remove
