require("lspsaga").setup({
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
      vsplit = "<C-v>",
      split = "<C-s>",
      tabe = "<C-t>",
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
      vsplit = "<C-v>",
      split = "<C-s>",
      tabe = "<C-t>",
      tabnew = "<C-t>",
      close = "<C-c>",
      quit = "q",
      shuttle = "<C-r>",
    },
  },
  hover_doc = {
    open_link = "<CR>",
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
    win_position = "left",
    close_after_jump = true,
    keys = {
      jump = "<CR>",
    },
  },
  implement = {
    enable = true,
  },
})
