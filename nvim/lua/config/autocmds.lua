vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})

vim.cmd([[
  augroup RunCommandOnAstroSave
    autocmd!
    autocmd BufWritePost *.astro call system('npx prettier -w ' . expand('%')) | e
  augroup END
]])

vim.cmd([[ let g:astro_typescript = 'enable' ]])
vim.cmd([[ let g:astro_stylus = 'enable' ]])

if vim.g.neovide then
  vim.o.guifont = "FiraCode Nerd Font Mono"

  -- Window
  local transparency = 0.5
  vim.g.neovide_transparency = transparency
  vim.g.transparency = transparency
  vim.g.neovide_window_blurred = true
  vim.g.neovide_floating_blur_amount_x = 5.0
  vim.g.neovide_floating_blur_amount_y = 5.0
  vim.g.neovide_scale_factor = 1.2

  -- Animation
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_unlink_border_highlights = true
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_refresh_rate_idle = 1
  vim.g.neovide_no_idle = false
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_mode = "sonicboom"
end
