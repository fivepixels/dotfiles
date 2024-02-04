return {
  {
    "echasnovski/mini.surround",
    keys = function(_, keys)
      local plugin = require("lazy.core.config").spec.plugins["mini.surround"]
      local opts = require("lazy.core.plugin").values(plugin, "opts", false)
      local mappings = {
        { opts.mappings.add, desc = "plugin > surround: add surrounding", mode = { "n", "v" } },
        { opts.mappings.delete, desc = "plugin > surround: delete surrounding" },
        { opts.mappings.find, desc = "plugin > surround: find surroung" },
        { opts.mappings.find_left, desc = "plugin > surround: find surround" },
        { opts.mappings.highlight, desc = "plugin > surround: highlight surrounding" },
        { opts.mappings.replace, desc = "plugin > surround: replace surrounding" },
        { opts.mappings.update_n_lines, desc = "plugin > surround: update n lines" },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
    opts = {
      mappings = {
        add = "<leader>ga",
        delete = "<leader>gd",
        find = "<leader>gf",
        find_left = "<leader>gF",
        highlight = "<leader>gh",
        replace = "<leader>gr",
      },
    },
  },

  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      local cmp = require("cmp")

      table.insert(opts.sources, { name = "emoji" })

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      })
    end,
  },
}
