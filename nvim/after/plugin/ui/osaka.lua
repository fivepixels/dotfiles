local osaka = require("solarized-osaka");

osaka.setup({
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

vim.cmd([[ colorscheme solarized-osaka-night ]])
