local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load({
  exclude = { "javascript" }
})

luasnip.setup({
  history = true,
  delete_check_events = "TextChanged"
})

local map = vim.keymap.set

map("i", "<Tab>", function()
  return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
end)

map("s", "<Tab>", function()
  return luasnip.jump(1)
end)

map({ "i", "s" }, "<S-Tab>", function()
  return luasnip.jump(-1)
end)
