local status, colorizer = pcall(require, "colorizer")
if (not status) then
  print("colorizer is not installed.")
  return
end

colorizer.setup({
  "*";
})
