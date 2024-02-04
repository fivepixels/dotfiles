return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        comments = {},
        keywords = { italic = true },
        functions = { italic = true, bold = true },
        variables = { bold = true },
      },
      dim_inactive = true,
      lualine_bold = true,
    },
    config = function()
      vim.cmd([[ colorscheme solarized-osaka ]])
    end,
  },
}
