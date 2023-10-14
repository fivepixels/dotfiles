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
      quit = 'q',
      shuttle = 'r',
    }
  },
  hover_doc = {
    open_link = '<C-w>e',
    open_cmd = '!chrome',
  },
  lightbulb = {
    enable = false,
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
      quit = 'q',
      select = 's',
    },
  },
})

-- Maps
local diagnostic = require("lspsaga.diagnostic")
local keymap = vim.keymap

local nmap = function(keys, func, desc)
  if desc then
    desc = 'Lspsaga: ' .. desc
  end

  vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
end

nmap('<leader>lf', '<Cmd>Lspsaga finder<CR>', "[L]spsaga [F]inder")                                      -- Finder
nmap('<leader>lp', '<Cmd>Lspsaga peek_type_definition<CR>', "[L]spsaga [P]eek definition")               -- Peek Definition
nmap('<leader>lg', '<Cmd>Lspsaga goto_definition<CR>', "[L]spsaga [G]oto definition")                    -- Goto Definition
nmap('<leader>lh', '<Cmd>Lspsaga hover_doc<CR>', "[L]spsaga [H]over Documentation")                      -- Hover Documentation
nmap('<leader>lo', '<Cmd>Lspsaga outline<CR>', "[L]spsaga [O]utline")                                    -- Outline
nmap('<leader>lr', '<Cmd>Lspsaga rename<CR>', "[L]spsaga [R]ename")                                      -- Rename
keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', { noremap = true, silent = true }) -- Signature Help
vim.keymap.set({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>",
  { noremap = true, silent = true, desc = "Lspsaga: [L]spsaga [C]ode Action" })                          -- Code Action

-- Move to Next/Prev Diagnostic
keymap.set('n', '<C-n>', function()
  diagnostic:goto_prev({ severity = vim.diagnostic.severity.ERROR })
end) -- Next
keymap.set('n', '<C-p>', function()
  diagnostic:goto_next({ severity = vim.diagnostic.severity.ERROR })
end) --  Prev
