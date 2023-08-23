local status, nvimtree = pcall(require, "nvim-tree")
if (not status) then return end

-- https://github.com/nvim-tree/nvim-tree.lua

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

local api = require "nvim-tree.api"

-- Keymap Settings
local function nvim_on_attach(bufnr)
  local function get_opts (desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set("n", "K", api.node.show_info_popup, get_opts("Hover Info"))
  vim.keymap.set("n", "<CR>", api.node.open.edit, get_opts("Open the file Vertically"))
  vim.keymap.set("n", "<C-s>", api.node.open.horizontal, get_opts("Open the file Vertically"))
  vim.keymap.set("n", "<C-v>", api.node.open.vertical, get_opts("Open the file Horizontally"))
  vim.keymap.set("n", "<C-t>", api.node.open.tab, get_opts("Open the file in a new tab"))
  vim.keymap.set("n", "<C-i>", api.fs.create, get_opts("Create a file"))
  vim.keymap.set("n", "<C-d>", api.fs.remove, get_opts("Create a file"))
  vim.keymap.set("n", "<C-r>", api.fs.rename, get_opts("Rename"))
  vim.keymap.set("n", "<C-q>", api.tree.close, get_opts("Close"))
  vim.keymap.set("n", "<C-h>", api.tree.change_root_to_parent, get_opts("Go to parent directory"))
  vim.keymap.set("n", "h", api.node.navigate.parent_close, get_opts("Go to parent directory"))
end

nvimtree.setup({
  sort_by = "case_sensitive",
  view = {
    width = {
      min = 25,
      max = 25
    },
    debounce_delay = 3000,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_clean = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    debounce_delay = 3000
  },
  actions = {
    expand_all = {
      max_folder_discovery = 10,
      exclude = {
        ".git",
        "node_modules",
      }
    }
  },
  on_attach = nvim_on_attach
})

-- Keymaps
local keymap = vim.keymap

keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<CR>", {desc = "Open Nvim"})
keymap.set("n", "<leader>nf", "<cmd>NvimTreeFocus<CR>", {desc = "Focus Nvim"})
