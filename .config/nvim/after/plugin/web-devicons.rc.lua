local status, icons = pcall(require, "nvim-web")
if (not status) then return end

-- https://github.com/ryanoasis/vim-devicons/blob/master/plugin/webdevicons.vim

icons.setup {
  override = { },
  default = true,
}
