local hipatterns = require("mini.hipatterns")
local tailwindcss = require("tailwindcss-colorizer-cmp")

tailwindcss.setup({
	color_square_width = 2,
})

hipatterns.setup({
	tailwind = {
		enabled = true,
		ft = { "typescriptreact", "javascriptreact", "css", "javascript", "typescript", "html" },
	},
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color({ priority = 2000 }),
		shorthand = {
			pattern = "()#%x%x%x()%f[^%x%w]",
			group = function(_, _, data)
				local match = data.full_match
				local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
				local hex_color = "#" .. r .. r .. g .. g .. b .. b

				return hipatterns.compute_hex_color_group(hex_color, "bg")
			end,
			extmark_opts = { priority = 2000 },
		},
	},
	delay = {
		text_change = 500,
		scroll = 25,
	},
})
