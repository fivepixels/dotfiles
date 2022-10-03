local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

nvimtree.setup({
  sort_by = "extension",
  view = {
    adaptive_size = false,
    centralize_selection = true,
    side = "left",
    width = 20,
    mappings = {
      list = {
        { key = "i", action = "edit" },
        { key = "p", action = "preview" },
        { key = "n", action = "create" },
        { key = "s", action = "" },
      }
    },
  },
  renderer = {
    add_trailing = true,
    highlight_git = true,
    full_name = true,
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
