local status, icons = pcall(require, "nvim-web-devicons")
if (not status) then
  print("nvim-web-devicons is not installed.")
  return
end

icons.setup {
  override = {
  },
  default = true,
}
