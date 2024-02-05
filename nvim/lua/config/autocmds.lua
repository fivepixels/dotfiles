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
