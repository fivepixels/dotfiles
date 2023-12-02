return {
  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {
      highlighters = {
        hsl_color = {
          pattern = "hsl%(%d+,? %d+,? %d+%)",
          group = function(_, match)
            local utils = require("cattynip.utils")
            local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
            h, s, l = tonumber(h), tonumber(s), tonumber(l)
            local hex_color = utils.hslToHex(h, s, l)
            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
          end,
        },
      },
    },
  },

  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        blame = "<leader>gb",
        browse = "<leader>go",
      },
    },
  },

  {
    "anuvyklack/pretty-fold.nvim",
    opts = {
      keep_indentation = false,
      fill_char = "━",
      sections = {
        left = {
          "━ ",
          function()
            return string.rep("*", vim.v.foldlevel)
          end,
          " ━┫",
          "content",
          "┣",
        },
        right = {
          "┫ ",
          "number_of_folded_lines",
          ": ",
          "percentage",
          " ┣━━",
        },
      },
      remove_fold_markers = false,
      process_comment_signs = false,
    },
  },
}
