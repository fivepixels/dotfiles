local status, telescope = pcall(require, 'telescope')
if (not status) then return end

-- https://github.com/nvim-telescope/telescope.nvim

-- Take the funtions provided by Telescope
local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

-- Load the extensions
telescope.load_extension("file_browser")
telescope.load_extension("http")

local fb_actions = require 'telescope'.extensions.file_browser.actions
local function show_http_list ()
  require 'telescope'.extensions.http.list()
end

-- Configure Telescope
telescope.setup({
  defaults = {
    winblen = 80,
    wrape_results = true,
    prompt_prefix = " ➜ ",
    selection_caret = " ➜ ",
    path_display = {
      "smart"
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
          vim.cmd('startinsert')
        end,
    },
  },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
    http = {
      open_url = 'open %s'
    },
    emoji = {},
  },
}})

-- Set the keymaps
local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local nmap = function(keys, func, desc)
  if desc then
    desc = 'Telescope: ' .. desc
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

local keymap = vim.keymap

nmap(
  "<leader>ff",
  function()
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
  end,
  "[F]ind [F]iles"
)

nmap(
  "<leader>fd",
  function ()
    builtin.diagnostics()
  end,
  "[F]ind [D]iagnostics"
)

nmap(
  "<leader>fw",
  function ()
    builtin.current_buffer_fuzzy_find({})
  end,
  "[F]ind [W]ord"
)

-- Git
nmap(
  "<leader>gm",
  function ()
    builtin.git_bcommits({
      git_command = { "git", "log", "--pretty=oneline", "--abbrev-commit", "--", "." }
    })
  end,
  "Find [G]it [M]essage"
)

nmap(
  '<leader>gs',
  function()
    builtin.git_status({})
  end,
  "Find [G]it [S]tatus"
)

vim.keymap.set("n", "<leader>ht", show_http_list)
