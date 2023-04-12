local status, git = pcall(require, "git")
if (not status) then return end

-- https://github.com/dinhhuy258/git.nvim

git.setup({ })
