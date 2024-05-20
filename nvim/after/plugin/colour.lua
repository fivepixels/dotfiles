require("solarized-osaka").setup({
  transparent = true,
  styles = {
    comments = {},
    keywords = { italic = true },
    functions = { italic = true, bold = true },
    variables = { bold = true },
  },
  dim_inactive = true,
  lualine_bold = true,
})

require("lualine").setup({
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

vim.cmd([[ colorscheme solarized-osaka-night ]])
