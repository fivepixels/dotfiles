local status, fidget = pcall(require, "fidget")
if (not status) then return end

fidget.setup({
  window = {
    border = "rounded"
  }
})
