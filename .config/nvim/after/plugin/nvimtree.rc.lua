local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

nvimtree.setup({
  sort_by = "extension",
  view = {
    adaptive_size = true,
    side = "left",
    mappings = {
      list = {
        { key = "i", action = "edit" },
        { key = "p", action = "preview" },
        { key = "n", action = "create" },
        { key = "", action = "" },
        { key = "", action = "" },
        { key = "", action = "" },
        { key = "", action = "" },
        { key = "", action = "" },
        { key = "", action = "" },
        { key = "", action = "" },
        { key = "", action = "" },
        { key = "", action = "" },
      }
    }
  },
  renderer = {
    add_trailing = true,
    full_name = false,
    highlight_git = true,
  },
  diagnostics = {
    enable = true,
  },
  filters = {
    dotfiles = false,
  },
  git = {
    timeout = 1000,
  },
  actions = {
    change_dir = {
      global = true,
    },
    expand_all = {
      max_folder_discovery = 100,
    }
  },
})
