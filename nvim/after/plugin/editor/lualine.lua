local lualine = require("lualine")

lualine.setup({
  options = {
    theme = 'solarized_dark',
    component_separators = { left = ' ▎', right = ' ▎'},
    section_separators = { left = '', right = ''},
    globalstatus = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

