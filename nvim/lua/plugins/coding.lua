return {
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
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "plugin > telescope: find diagnostics",
      },
      {
        "<leader>fb",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "plugin > telescope: find buffers",
      },
      {
        "<leader>fw",
        function()
          local builtin = require("telescope.builtin")
          builtin.current_buffer_fuzzy_find()
        end,
        desc = "plugin > telescope: find words",
      },
      {
        "<leader>gc",
        function()
          local builtin = require("telescope.builtin")
          builtin.git_bcommits({
            git_command = { "git", "log", "--pretty=oneline", "--", "." },
          })
        end,
        desc = "plugin > telescope: find git commits",
      },
      {
        "<leader>gb",
        function()
          local builtin = require("telescope.builtin")
          builtin.git_branches()
        end,
        desc = "plugin > telescope: find git branches",
      },
      {
        "<leader>gs",
        function()
          local builtin = require("telescope.builtin")
          builtin.git_status()
        end,
        desc = "plugin > telescope: find git status files",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
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
