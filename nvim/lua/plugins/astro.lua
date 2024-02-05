return {
  {
    "cattynip/vim-astro",
  },

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["astro"] = { "prettier" },
      },
    },
  },

  {
    "wavded/vim-stylus",
  },

  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override_by_extension = {
        ["astro"] = {
          icon = "",
          color = "#f1502f",
          name = "Astro",
        },
      },
    },
  },
}
