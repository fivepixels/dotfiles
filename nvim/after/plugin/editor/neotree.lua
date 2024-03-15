local sidebar = require("neo-tree")

vim.keymap.set("n", "<leader>nt", "<cmd>Neotree toggle<cr>")

sidebar.setup({
  close_if_last_window = true,
  sources = { "filesystem" },
  default_component_configs = {
    indent = {
      with_expanders = true,
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    git_status = {
      symbols = {
        added = "✚",
        modified = "",
      }
    }
  },
  window = {
    position = "right",
    width = 40,
    mappings = {
      ["<C-c>"] = "cancel",
      ["p"] = { "toggle_preview" },
      ["l"] = "focus_preview",
      ["<C-s>"] = "open_split",
      ["<C-v>"] = "open_vsplit",
      ["S"] = "split_with_window_picker",
      ["s"] = "vsplit_with_window_picker",
      ["<C-t>"] = "open_tabnew",
      ["c"] = "close_node",
      ["C"] = "close_all_nodes",
      ["z"] = "expand_all_nodes",
      ["<C-i>"] = "add",
      ["<C-d>"] = "delete",
      ["<C-r>"] = "rename",
      ["<C-q>"] = "close_window",
      ["r"] = "refresh",
      ["?"] = "show_help",
    }
  },
  filesystem = {
    bind_to_cwd = false,
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,
      hide_by_name = {
        "node_modules",
        "dist",
      },
      always_show = {
        "package.json",
        "README.md",
      },
      never_show = {
        ".DS_Store",
      },
    },
    window = {
      mappings = {
        ["<C-h>"] = "navigate_up",
        ["<C-l>"] = "set_root",
        ["h"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["<BS>"] = "clear_filter",
        ["g"] = "next_git_modified",
        ["G"] = "prev_git_modified",
      },
    },
  },
})

