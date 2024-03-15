local ibl = require("ibl")

ibl.setup({
  indent = {
    char = "▎",
    tab_char = "▎",
  },
  scope = {
    enabled = true,
    show_start = true,
    show_end = true,
    injected_languages = false,
    highlight = { "Function", "Label" },
  },
  exclude = {
    filetypes = {
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "trouble",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
      "lazyterm",
    },
  },
})
