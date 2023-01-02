local status, bufferline = pcall(require, "bufferline")
if (not status) then
  print("bufferline is not installed.")
  return
end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
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
  },
})

local keymap = vim.keymap
keymap.set('n', '<leader>tn', ":tabnew<Return>")
keymap.set('n', '<leader>th', ":tabprevious<Return>")
keymap.set('n', '<leader>tl', ":tabnext<Return>")
keymap.set('n', '<leader>tn', ":tabnew<Return>")
keymap.set('n', '<leader>te', ":tabedit<Return>")
keymap.set('n', '<leader>tx', ":tabclose<Return>")
keymap.set('n', '<leader>t<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
keymap.set('n', '<leader>tS-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
