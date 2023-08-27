local status, lspsaga = pcall(require, "lspsaga");
if (not status) then return end

-- Configure Lspsaga
lspsaga.setup({
  ui = {
    border = 'rounded',
    code_action = ' ',
    keys = {
      scroll_up = '<C-u>',
      scroll_down = '<C-d>'
    }
  },
  symbol_in_winbar = {
    enable = true,
  },
  definition = {
    keys = {
      edit = '<CR>',
      vsplit = 'v',
      split = 's',
      tabe = 't',
      quit = 'q',
      close = '<C-c>',
    }
  },
  diagnostic = {
    extend_relatedInformation = true,
    keys = {
      exec_action = '<CR>',
      toggle_or_jump = '<C-t>',
      quit = 'q',
      quit_in_show = '',
    }
  },
  finder = {
    max_height = 1,
    left_width = 0.2,
    right_width = 0.6,
    keys = {
      toggle_or_open = '<CR>',
      vsplit = 'v',
      split = 's',
      tabe = 't',
      tabnew = 't',
      close = '<C-c>',
      quit = '<C-q>',
      shuttle = 'r',
    }
  },
  hover_doc = {
    open_link = '<C-w>e',
    open_cmd = '!chrome',
  },
  lightbulb = {
    enable = true,
  },
  outline = {
    win_position = "left",
    win_width = 25,
    layout = "normal",
    keys = {
      toggle_or_jump = '<CR>',
      jump = '<C-j>',
      quit = 'q',
    }
  },
  rename = {
    in_select = false,
    auto_save = true,
    keys = {
      quit = '<C-q>',
      select = 's',
    },
  },
})

-- Maps
local diagnostic = require("lspsaga.diagnostic")
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>lf', '<Cmd>Lspsaga finder<CR>', opts) -- Finder
keymap.set('n', '<leader>lp', '<Cmd>Lspsaga peek_definition<CR>', opts) -- Peek Definition
keymap.set('n', '<leader>lh', '<Cmd>Lspsaga hover_doc<CR>', opts) -- Hover Documentation
keymap.set('n', '<leader>lo', '<Cmd>Lspsaga outline<CR>', opts) -- Outline
keymap.set('n', '<leader>lr', '<Cmd>Lspsaga rename<CR>', opts) -- Rename
vim.keymap.set({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>") -- Code Action
keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

-- Move to Next/Prev Diagnostic
keymap.set('n', '<C-n>', function()
  diagnostic:goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts) -- Next
keymap.set('n', '<C-p>', function ()
  diagnostic:goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts) --  Prev
