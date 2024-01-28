return {
	-- git
	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		keys = {
			{
				"<leader>gb",
				function()
					require("git.blame").blame()
				end,
				desc = "plugin > git: open git blame window",
			},
			{
				"<leader>go",
				function()
					require("git.browse").open()
				end,
				desc = "plugin > git: open the current file in github",
			},
			{
				"<leader>gd",
				function()
					require("git.diff").open()
				end,
				desc = "plugin > git: open a diff window",
			},
		},
	},

	-- telescope
	{
		"telescope.nvim",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-telescope/telescope-file-browser.nvim",
		},
		keys = {
			{
				"<leader>fa",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
					})
				end,
				desc = "plugin > telescope: search for all files in the current working directory",
			},
			{
				"<leader>fs",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep({
						additional_args = { "--hidden" },
					})
				end,
				desc = "plugin > telescope: search for a string",
			},
			{
				"<leader>fb",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "plugin > telescope: search for buffers",
			},
			{
				"<leader>fd",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "plugin > telescope: search for the diagnostics",
			},
			{
				"<leader>fn",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
				desc = "plugin > telescope: search for the function names, and variables from Treesitter",
			},
			{
				"<leader>fw",
				function()
					local builtin = require("telescope.builtin")
					builtin.current_buffer_fuzzy_find({})
				end,
				desc = "plugin > telescope: search for words in the current file",
			},
			-- {
			-- 	"<leader>ff",
			-- 	function()
			-- 		local telescope = require("telescope")
			--
			-- 		local function telescope_buffer_dir()
			-- 			return vim.fn.expand("%:p:h")
			-- 		end
			--
			-- 		telescope.extensions.file_browser.file_browser({
			-- 			path = "%:p:h",
			-- 			cwd = telescope_buffer_dir(),
			-- 			respect_gitignore = false,
			-- 			hidden = true,
			-- 			grouped = true,
			-- 			previewer = false,
			-- 			initial_mode = "normal",
			-- 			layout_config = { width = 130, height = 40 },
			-- 		})
			-- 	end,
			-- 	desc = "plugin > telescope: search for the files in the current working directory",
			-- },
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				winblen = 60,
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
				prompt_prefix = " ➜ ",
				selection_caret = "➜ ",
				dynamic_preview_title = true,
				mappings = {
					n = {},
					i = {
						["<C-q>"] = actions.close,
						["<C-c>"] = actions.close,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-k>"] = actions.preview_scrolling_up,
						["<C-j>"] = actions.preview_scrolling_down,
						["/"] = function()
							vim.cmd("startinsert")
						end,
					},
				},
			})
			opts.pickers = {
				diagnostics = {
					theme = "ivy",
					initial_mode = "normal",
					layout_config = {
						preview_cutoff = 9999,
					},
				},
			}
			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
					mappings = {
						["<C-i>"] = fb_actions.create,
						["<C-d>"] = fb_actions.remove,
						["<C-r>"] = fb_actions.rename,
						["<C-h>"] = fb_actions.goto_parent_dir,
					},
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},
}
