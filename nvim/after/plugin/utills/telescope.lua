local status, telescope = pcall(require, 'telescope')
if (not status) then return end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

telescope.load_extension("file_browser")
telescope.load_extension("http")

local fb_actions = require 'telescope'.extensions.file_browser.actions
local function show_http_list()
  require 'telescope'.extensions.http.list()
end

telescope.setup({
  defaults = {
    winblen = 60,
    wrape_results = true,
    prompt_prefix = " ➜ ",
    selection_caret = "➜ ",
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
  }
})

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local nmap = function(keys, func, desc)
  if desc then
    desc = 'Telescope: ' .. desc
  end

  vim.keymap.set('n', keys, func, { desc = desc })
end

nmap(
  "ff",
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
  function()
    builtin.diagnostics()
  end,
  "[F]ind [D]iagnostics"
)

nmap(
  "<leader>fb",
  function()
    builtin.buffers()
  end,
  "[F]ind [B]uffers"
)

nmap(
  "<leader>fw",
  function()
    builtin.current_buffer_fuzzy_find({})
  end,
  "[F]ind [W]ord"
)

-- Man
nmap(
  "<leader>fm",
  function()
    builtin.man_pages()
  end,
  "[F]ind [M]anual pages"
)

nmap(
  "<leader>ft",
  function()
    builtin.help_tags()
  end,
  "[F]ind [T]ags"
)

-- Git
nmap(
  "<leader>gc",
  function()
    builtin.git_bcommits({
      git_command = { "git", "log", "--pretty=oneline", "--", "." }
    })
  end,
  "[F]ind [G]it [C]ommits including all commits"
)

nmap(
  "<leader>gb",
  function()
    builtin.get_branches()
  end,
  "[F]ind [G]it [B]ranches"
)

nmap(
  '<leader>gs',
  function()
    builtin.git_status({})
  end,
  "[F]ind [G]it [S]tatus"
)

vim.keymap.set("n", "<leader>fh", show_http_list)
