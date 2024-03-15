local lspsaga = require("lspsaga")

lspsaga.setup({
  ui = {
    border = "rounded",
    code_action = "󰌶",
    keys = {
      scroll_up = "<C-u>",
      scroll_down = "<C-d>",
    },
  },
  symbol_in_winbar = {
    enable = true,
  },
  definition = {
    keys = {
      edit = "<CR>",
      vsplit = "v",
      split = "s",
      tabe = "t",
      quit = "q",
      close = "<C-c>",
    },
  },
  diagnostic = {
    extend_relatedInformation = true,
    keys = {
      exec_action = "<CR>",
      toggle_or_jump = "<C-t>",
      quit = "q",
      quit_in_show = "",
    },
  },
  finder = {
    max_height = 1,
    left_width = 0.2,
    right_width = 0.6,
    keys = {
      toggle_or_open = "<CR>",
      vsplit = "v",
      split = "s",
      tabe = "t",
      tabnew = "t",
      close = "<C-c>",
      quit = "q",
      shuttle = "r",
    },
  },
  hover_doc = {
    open_link = "<C-w>e",
    open_cmd = "!chrome",
  },
  lightbulb = {
    enable = false,
  },
  rename = {
    in_select = false,
    auto_save = true,
    keys = {
      quit = "q",
      select = "s",
    },
  },
  outline = {
    close_after_jump = true,
    keys = {
      jump = "i",
    },
  },
})

-- Lspsaga
local map = vim.keymap.set
map("n", "<leader>lf", "<Cmd>Lspsaga finder<CR>")
map("n", "<leader>lp", "<Cmd>Lspsaga peek_type_definition<CR>")
map("n", "<leader>lg", "<Cmd>Lspsaga goto_definition<CR>")
map("n", "<leader>lh", "<Cmd>Lspsaga hover_doc<CR>")
map("n", "<leader>lr", "<Cmd>Lspsaga rename<CR>")
map("n", "<leader>lo", "<Cmd>Lspsaga outline<CR>")
map("n", "<C-n>", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
map("n", "<C-p>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
map("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>")
