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

require("nvim-web-devicons").setup()
require("mini.comment").setup({})
require("mini.trailspace").setup({})
require("mini.cursorword").setup({})
require("mini.statusline").setup()
require("mini.notify").setup({})
require("mini.notify").setup({})
require("mini.pairs").setup({})

require("mini.splitjoin").setup({ mappings = { toggle = "gs" } })
require("mini.indentscope").setup({ symbol = "▎", options = { try_as_border = true } })
require("mini.basics").setup({ options = { win_borders = "double" } })
require("mini.tabline").setup({ tabpage_section = "right" })

require("mini.surround").setup({
  mappings = {
    add = "ga",
    delete = "gd",
    find = "gf",
    replace = "gr",
    find_left = "gF",
    highlight = "gh",
    update_n_lines = "gn",
    suffix_last = "l",
    suffix_next = "n",
  },
})

require("mini.move").setup({
  mappings = {
    left = "<C-h>",
    right = "<C-l>",
    down = "<C-j>",
    up = "<C-k>",
    line_left = "<C-h>",
    line_right = "<C-l>",
    line_down = "<C-j>",
    line_up = "<C-k>",
  },
})

require("mini.clue").setup({
  clues = {},
  triggers = {
    { mode = "n", keys = "<leader>" },
    { mode = "n", keys = "s" },
    { mode = "n", keys = "g" },
    { mode = "v", keys = "g" },
  },
  window = { delay = 0 },
})

require("mini.hipatterns").setup({
  tailwind = {
    enabled = true,
    ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" },
  },
  highlighters = {
    hex_color = require("mini.hipatterns").gen_highlighter.hex_color({ priority = 2000 }),
    shorthand = {
      pattern = "()#%x%x%x()%f[^%x%w]",
      group = function(_, _, data)
        local match = data.full_match
        local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
        local hex_color = "#" .. r .. r .. g .. g .. b .. b
        return require("mini.hipatterns").compute_hex_color_group(hex_color, "bg")
      end,
      extmark_opts = { priority = 2000 },
    },
  },
  delay = { text_change = 0, scroll = 50 },
})

require("mini.ai").setup({
  n_lines = 100,
  mappings = {
    around = "a",
    inside = "an",
    around_next = "an",
    inside_next = "in",
    around_last = "al",
    inside_last = "il",
    goto_left = "gh",
    goto_right = "gl",
  },
  custom_textobjects = {
    o = require("mini.ai").gen_spec.treesitter({
      a = { "@block.outer", "@conditional.outer", "@loop.outer" },
      i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    }, {}),
    f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
    c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
    t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
  },
})

require("mini.diff").setup({
  view = {
    style = "sign",
    signs = { add = "▎", change = "▎", delete = "" },
    priority = 199,
  },
  source = nil,
  delay = {
    text_change = 200,
  },

  mappings = {
    apply = "",
    reset = "",
    textobject = "",
    goto_first = "",
    goto_prev = "",
    goto_next = "",
    goto_last = "",
  },
})

require("treesj").setup({
  max_join_length = 500,
})

require("ts_context_commentstring").setup({})

vim.cmd([[ colorscheme solarized-osaka-night ]])

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    require("mini.trailspace").trim()
    require("mini.trailspace").trim_last_lines()
  end,
})

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })

vim.keymap.set("n", "<leader>ji", function()
  require("treesj").toggle()
end, { desc = "Toggle joining blocks" })
vim.keymap.set("n", "<leader>jj", function()
  require("treesj").join()
end, { desc = "Join blocks" })
vim.keymap.set("n", "<leader>js", function()
  require("treesj").split()
end, { desc = "Split blocks" })
