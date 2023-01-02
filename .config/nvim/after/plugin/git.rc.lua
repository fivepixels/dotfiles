local status, git = pcall(require, "git")
if (not status) then
  print("git is not installed.")
  return
end

git.setup({
  keymaps = {
    blame = "<leader>gb",
    browse = "<leader>gr"
  }
})
