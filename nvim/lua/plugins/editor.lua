return {
  {
    "folke/flash.nvim",
    enabled = false,
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        enabled = false,
      },
      {
        "<leader>nt",
        "<cmd>Neotree toggle<cr>",
        desc = "plugin > neotree: toggle neotree window",
      },
    },
    opts = {
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      window = {
        width = 30,
        mappings = {
          ["<CR>"] = "open",
          ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["l"] = "focus_preview",
          ["s"] = "",
          ["v"] = "",
          ["t"] = "",
          ["<C-s>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
          ["<C-t>"] = "open_tabnew",
          ["<C-c>"] = "close_node",
          ["c"] = "close_all_subnodes",
          ["C"] = "close_all_nodes",
          ["<C-i>"] = {
            "add",
            config = {
              show_path = "relative",
            },
          },
          ["<C-d>"] = "delete",
          ["<C-r>"] = "rename",
          ["<C-q>"] = "close_window",
          ["r"] = "refresh",
          ["/"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {
            "node_modules",
            "dist",
          },
          never_show = {
            ".DS_Store",
          },
        },
      },
    },
  },

  {
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
        "<leader>ff",
        function()
          require("telescope").extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = vim.fn.expand("%:p:h"),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = true,
            layout_strategy = "horizontal",
            layout_config = { width = 130, height = 40 },
          })
        end,
        desc = "plugin > telescope: find files",
      },
      {
        "<leader>fs",
        function()
          require("telescope.builtin").find_files({})
        end,
        desc = "plugin > telescope: find files (builtin)",
      },
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "plugin > telescope: find config files",
      },
      {
        "<leader>fd",
        function()
          require("telescope.builtin").diagnostics()
        end,
        desc = "plugin > telescope: find diagnostics",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "plugin > telescope: find buffers",
      },
      {
        "<leader>fw",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "plugin > telescope: find words",
      },
      {
        "<leader>gc",
        function()
          require("telescope.builtin").git_bcommits({
            git_command = { "git", "log", "--pretty=oneline", "--", "." },
          })
        end,
        desc = "plugin > telescope: find git commits",
      },
      {
        "<leader>gb",
        function()
          require("telescope.builtin").git_branches()
        end,
        desc = "plugin > telescope: find git branches",
      },
      {
        "<leader>gs",
        function()
          require("telescope.builtin").git_status()
        end,
        desc = "plugin > telescope: find git status files",
      },
    },
    opts = {
      defaults = {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },

      pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults.mappings = {
        ["i"] = {
          ["<C-k>"] = actions.preview_scrolling_up,
          ["<C-j>"] = actions.preview_scrolling_down,
          ["<C-t>"] = actions.file_tab,
          ["<C-s>"] = actions.file_split,
          ["<C-v>"] = actions.file_vsplit,
        },
      }

      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-i>"] = fb_actions.create,
              ["<C-r>"] = fb_actions.rename,
              ["<C-d>"] = fb_actions.remove,
              ["<C-h>"] = fb_actions.goto_parent_dir,
            },
          },
        },
      }

      telescope.setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
