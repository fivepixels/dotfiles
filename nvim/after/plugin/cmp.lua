local cmp = require("cmp")
local defaults = require("cmp.config.default")()
local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()

luasnip.setup({
  history = true,
  delete_check_events = "TextChanged",
})

cmp.setup({
  completion = {
    completeopt = "menuone,preview,noinsert",
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-k>"] = cmp.mapping.scroll_docs(-4),
    ["<C-j>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<S-CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
  formatting = {
    format = function(_, item)
      -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/init.lua#L53
      local icons = {
        Array = " ",
        Boolean = "󰨙 ",
        Class = " ",
        Codeium = "󰘦 ",
        Color = " ",
        Control = " ",
        Collapsed = " ",
        Constant = "󰏿 ",
        Constructor = " ",
        Copilot = " ",
        Enum = " ",
        EnumMember = " ",
        Event = " ",
        Field = " ",
        File = " ",
        Folder = " ",
        Function = "󰊕 ",
        Interface = " ",
        Key = " ",
        Keyword = " ",
        Method = "󰊕 ",
        Module = " ",
        Namespace = "󰦮 ",
        Null = " ",
        Number = "󰎠 ",
        Object = " ",
        Operator = " ",
        Package = " ",
        Property = " ",
        Reference = " ",
        Snippet = " ",
        String = " ",
        Struct = "󰆼 ",
        TabNine = "󰏚 ",
        Text = " ",
        TypeParameter = " ",
        Unit = " ",
        Value = " ",
        Variable = "󰀫 ",
      }

      if icons[item.kind] then
        item.kind = icons[item.kind] .. string.upper(string.sub(item.kind, 1, 4))
      end

      return item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  sorting = defaults.sorting,
})
