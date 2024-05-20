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
--   custom_textobjects = {
--     o = ai.gen_spec.treesitter({
--       a = { "@block.outer", "@conditional.outer", "@loop.outer" },
--       i = { "@block.inner", "@conditional.inner", "@loop.inner" },
--     }, {}),
--     f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
--     c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
--     t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
--   },
})

require("mini.pairs").setup({
  modes = { insert = true, command = true, terminal = true },
})

-- require("mini.base16").setup({
--   -- Table with names from `base00` to `base0F` and values being strings of
--   -- HEX colors with format "#RRGGBB". NOTE: this should be explicitly
--   -- supplied in `setup()`.
--   -- palette = "minischeme",
--   use_cterm = true,
--   plugins = { default = true },
-- })
require("mini.basics").setup({
  -- Options. Set to `false` to disable.
  options = {
    basic = true,
    extra_ui = true,
    win_borders = 'double',
  },
  mappings = {
    basic = true,
    option_toggle_prefix = [[\t]],
    windows = false,
    move_with_alt = false,
  },
})
