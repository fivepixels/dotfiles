local status, zenMode = pcall(require, "zen-mode")
if (not status) then
  print("zen mode is not installed.")
  return
end

zenMode.setup {
  backdrop = 0.64,
  signcolumn = "yes",
  number = true,
  relativenumber = true,
  cursorline = true,
  cursorcolumn = true,
}
