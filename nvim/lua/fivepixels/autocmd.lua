vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*",
	callback = function()
		require("mini.trailspace").trim()
		require("mini.trailspace").trim_last_lines()
	end,
})

vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
