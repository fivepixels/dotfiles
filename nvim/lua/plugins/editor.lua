return {
  {
    "folke/flash.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      {
        "<leader>fe",
        enabled = false,
      },
      {
        "<leader>nt",
        "<cmd>Neotree toggle<cr>",
        desc = "plugin > neotree: toggle neotree window",
      },
    },
    opts = {
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      sort_case_insensitive = true,
      window = {
        width = 30,
        mappings = {
          ["<CR>"] = "open",
          ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          ["l"] = "focus_preview",
          ["s"] = "",
          ["v"] = "",
          ["t"] = "",
          ["<C-s>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
          ["<C-t>"] = "open_tabnew",
          ["<C-c>"] = "close_node",
          ["c"] = "close_all_subnodes",
          ["C"] = "close_all_nodes",
          ["<C-i>"] = {
            "add",
            config = {
              show_path = "relative",
            },
          },
          ["<C-d>"] = "delete",
          ["<C-r>"] = "rename",
          ["<C-q>"] = "close_window",
          ["r"] = "refresh",
          ["/"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
          ["i"] = "show_file_details",
        },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
          hide_by_name = {
            "node_modules",
            "dist",
          },
          never_show = {
            ".DS_Store",
          },
        },
      },
    },
  },
}
