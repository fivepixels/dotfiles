local status, autopairs = pcall(require, 'nvim-autopairs')
if (not status) then return {} end

-- https://github.com/windwp/nvim-autopairs

autopairs.setup({
	disable_filetype = { "TelescopePrompt", "vim" },
})

return {}
