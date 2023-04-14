local status, saga = pcall(require, "lspsaga")
if (not status) then return end

-- https://github.com/nvimdev/lspsaga.nvim

saga.setup({
  ui = {
    winblend = 20,
    border = 'double',
    colors = {
      normal_bg = '#ffffff'
    }
  },
  scroll_preview = {
    scroll_down = "<C-d>",
    scroll_up = "<C-u>"
  },
  finder = {
    max_height = 0.9,
    min_width = 20,
    keys = {
      jump_to = '<space>',
      expand_or_jump = "o",
      split = "i",
      vsplit = "v",
      tabe = "t",
      tabnew = 'r',
      quit = { "q", "<ESC>", "<C-c>" },
      close_in_preview = { "q", "<ESC>", "<C-c>" },
    }
  },
  code_action = {
    show_server_name = true,
    exec = { "<CR>", "i" }
  },
  lightbulb = {
    enable = true,
  },
  hover = {
    open_link = 'ex',
  },
  diagnostic = {
    on_insert = false,
    on_insert_follow = false,
    extend_relatedInformation = true,
  },
  rename = {
    quit = "<C-c>",
  },
  outline = {
    win_position = "left",
    win_width = 20,
    preview_width = 0.3,
    keys = {
      expand_or_jump = "i",
    }
  },
})

-- local dagnostic = require("lspsaga.diagnostic")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
keymap.set('n', '<leader>ef', '<Cmd>Lspsaga lsp_finder<CR>', opts)
keymap.set('n', '<leader>ep', '<Cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', '<leader>eg', '<Cmd>Lspsaga goto_definition<CR>', opts)
keymap.set('n', '<leader>eh', '<Cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', '<leader>ek', '<Cmd>Lspsaga hover_doc ++keep<CR>', opts)
keymap.set('n', '<leader>es', '<Cmd>Lspsaga show_diagnostic<CR>', opts)
keymap.set('n', '<leader>er', '<Cmd>Lspsaga rename ++project<CR>', opts)
keymap.set('n', '<leader>eo', '<Cmd>Lspsaga outline<CR>', opts)
keymap.set('n', '<leader>ea', '<Cmd>Lspsaga show_workspace_diagnostics<CR>', opts)
keymap.set('n', '<C-n>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', '<C-p>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

local codeaction = require("lspsaga.codeaction")
vim.keymap.set("n", "<leader>ca", function() codeaction:code_action() end, { silent = true })
vim.keymap.set("v", "<leader>ca", function()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
  codeaction:range_code_action()
end, { silent = true })
