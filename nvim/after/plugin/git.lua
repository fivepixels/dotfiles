local status_for_git, git = pcall(require, "git")
local status_for_signs, gitsigns = pcall(require, "gitsigns")
if (not status_for_git or not status_for_signs) then return end

-- https://github.com/dinhhuy258/git.nvim
-- https://github.com/lewis6991/gitsigns.nvim

git.setup({ })

gitsigns.setup({
  signs = {
    add          = { text = '+' },
    change       = { text = '~' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '|' },
  },
  max_file_length = 1000
})
