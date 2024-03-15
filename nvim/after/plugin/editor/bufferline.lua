local bufferline = require("bufferline")

bufferline.setup({
  options = {
    mode = "tabs",
    style_preset = bufferline.style_preset.minimal,
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    modified_icon = '●',
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = true,
    color_icons = true,
    show_buffer_icons = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    show_duplicate_prefix = true,
    persist_buffer_sort = true,
    separator_style = "slope",
    enforce_regular_tabs = true,
    always_show_bufferline = true
  }
})

