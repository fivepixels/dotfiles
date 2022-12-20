local status, git = pcall(require, "git")
if (not status) then return end

git.setup({
  keymaps = {
    blame = "gitb",
    quit_blame = "q",
    browse = "gitgo",
    diff = "gitdi",
  },
  target_branch = "master",
})
