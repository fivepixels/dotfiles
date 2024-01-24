local status, lspsaga = pcall(require, "lspsaga");
if (not status) then return end

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
  rename = {
    in_select = false,
    auto_save = true,
    keys = {
      quit = 'q',
      select = 's',
    },
  },
})
