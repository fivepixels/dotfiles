local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup({
  defaults = {
    wrap_results = true,
    prompt_prefix = " ➜ ",
    selection_caret = "➜ ",
    path_display = {
      "smart"
    },
    dynamic_preview_title = true,
    get_selection_window = function()
      local wins = vim.api.nvim_list_wins()
      table.insert(wins, 1, vim.api.nvim_get_current_win())
      for _, win in ipairs(wins) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].buftype == "" then
          return win
        end
      end
      return 0
    end,
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
          vim.cmd('startinsert')
        end,
      },
    },
    extensions = {
      file_browser = {
        theme = "ivy",
        hijack_netrw = true,
      },
    },
  }
})

telescope.load_extension("file_browser")

local map = vim.keymap.set

map("n", "<leader>ff", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = vim.fn.expand('%:p:h'),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    layout_strategy = "horizontal",
    layout_config = { width = 130, height = 40 }
  })
end)

map("n", "<leader>fd", function()
  builtin.diagnostics()
end)

map("n", "<leader>fb", function()
  builtin.buffers()
end)

map("n", "<leader>fw", function()
  builtin.current_buffer_fuzzy_find({})
end)

map("n", "<leader>gc", function()
  builtin.git_bcommits({
    git_command = { "git", "log", "--pretty=oneline", "--", "." }
  })
end)

map("n", "<leader>gb", function()
  builtin.get_branches()
end)

map("n", "<leader>gs", function()
  builtin.git_status({})
end)
