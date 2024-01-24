local status, onedark = pcall(require, "onedark")
if (not status) then return end

onedark.setup({
  style = 'darker',
  transparent = true,
  ending_tildes = false,
  cmp_itemkind_reverse = true,
  toggle_style_list = {'darker', 'deep'},
  code_style = {
    comments = 'none',
    keywords = 'italic',
    functions = 'italic,bold',
    strings = 'italic',
    variables = 'bold'
  },
  lualine = {
    transparent = true,
  },
})

onedark.load()
