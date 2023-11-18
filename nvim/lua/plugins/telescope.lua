return {
  "telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = {
    {
      "<leader>fd",
      function()
        local builtin = require("telescope.builtin")
        builtin.diagnostics()
      end,
      desc = "[F]ind [D]iagnostics",
    },

    {
      "<leader>fb",
      function()
        local builtin = require("telescope.builtin")
        builtin.buffers()
      end,
      desc = "[F]ind [B]uffers",
    },

    {
      "<leader>ff",
      function()
        local telescope = require("telescope")

        local function telescope_buffer_dir()
          return vim.fn.expand("%:p:h")
        end

        telescope.extensions.file_browser.file_browser({
          path = "%:p:h",
          cwd = telescope_buffer_dir(),
          respect_gitignore = false,
          hidden = true,
          grouped = true,
          previewer = true,
          layout_strategy = "horizontal",
          initial_mode = "normal",
          layout_config = { width = 130, height = 40 },
        })
      end,
      desc = "[F]ile [F]iles",
    },

    {
      "<leader>fw",
      function()
        local builtin = require("telescope.builtin")

        builtin.current_buffer_fuzzy_find({})
      end,
    },

    {
      "<leader>gc",
      function()
        local builtin = reuiqre("telescope.builtin")

        builtin.git_bcommits({
          git_command = { "git", "log", "--pretty=oneline", "--", "." },
        })
      end,
      "[F]ind [G]it [C]ommits including all commits",
    },

    {
      "<leader>gb",
      function()
        local builtin = require("telescope.builtin")

        builtin.get_branches()
      end,
      "[F]ind [G]it [B]ranches",
    },

    {
      "<leader>gs",
      function()
        local builtin = require("telescope.builtin")

        builtin.git_status({})
      end,
      "[F]ind [G]it [S]tatus",
    },
  },

  config = function(_, opts)
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions

    opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
      winblen = 60,
      wrape_results = true,
      prompt_prefix = " ➜ ",
      selection_caret = "➜ ",
      path_display = {
        "smart",
      },
      dynamic_preview_title = true,
      mappings = {
        i = {
          ["<C-q>"] = actions.close,
          ["<C-c>"] = actions.close,
          ["<C-s>"] = actions.select_horizontal,
          ["<C-v>"] = actions.select_vertical,
          ["<C-t>"] = actions.select_tab,
          ["<C-k>"] = actions.preview_scrolling_up,
          ["<C-j>"] = actions.preview_scrolling_down,
          ["<C-i>"] = fb_actions.create,
          ["<C-d>"] = fb_actions.remove,
          ["<C-r>"] = fb_actions.rename,
          ["<C-h>"] = fb_actions.goto_parent_dir,
          ["/"] = function()
            vim.cmd("startinsert")
          end,
        },
      },
    })
    opts.pickers = {
      diagnostics = {
        theme = "ivy",
        initial_mode = "normal",
        layout_config = {
          preview_cutoff = 200,
        },
      },
    }
    opts.extensions = {
      file_browser = {
        theme = "dropdown",
        hijack_netrw = true,
      },
    }
    telescope.setup(opts)
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("file_browser")
  end,
}
