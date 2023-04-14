local status, telescope = pcall(require, 'telescope')
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- https://github.com/nvim-telescope/telescope.nvim

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.load_extension("file_browser")

local fb_actions = require 'telescope'.extensions.file_browser.actions

telescope.setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { width = 130, height = 40 },
    mappings = {
      i = {
        ["<C-q>"] = actions.close,
        ["<C-c>"] = function()
        end,
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
      }
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
    http = {
      optn_url = 'open %s'
    }
  }
}

local keymap = vim.keymap

keymap.set('n', 'fe',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true,
    })
  end)

keymap.set('n', 'fd', function()
  builtin.diagnostics()
end)

keymap.set('n', 'fw', function()
  builtin.current_buffer_fuzzy_find({})
end)

keymap.set("n", "ff", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    layout_strategy = "horizontal",
    layout_config = { width = 130, height = 40 }
  })
end)

-- Git
keymap.set('n', 'gf', function()
  builtin.git_files({
    show_untracked = true
  })
end)
keymap.set('n', 'gm', function()
  builtin.git_bcommits({
    git_command = { "git", "log", "--pretty=oneline", "--abbrev-commit", "--", "." }
  })
end)
keymap.set('n', 'gs', function()
  builtin.git_status({})
end)
