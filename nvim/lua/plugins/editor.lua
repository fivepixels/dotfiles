local function nvim_on_attach(bufnr)
	local function get_opts(desc)
		return { desc = "Nvim Tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.g.loaded_netrw = 1
	vim.g.loaded_netrwPlugin = 1
	vim.opt.termguicolors = true

	local api = require("nvim-tree.api")
	local keymap = vim.keymap

	keymap.set("n", "K", api.node.show_info_popup, get_opts("Hover Info"))
	keymap.set("n", "<CR>", api.node.open.edit, get_opts("Open the file Vertically"))
	keymap.set("n", "<C-s>", api.node.open.horizontal, get_opts("Open the file Vertically"))
	keymap.set("n", "<C-v>", api.node.open.vertical, get_opts("Open the file Horizontally"))
	keymap.set("n", "<C-t>", api.node.open.tab, get_opts("Open the file in a new tab"))
	keymap.set("n", "<C-i>", api.fs.create, get_opts("Create a file"))
	keymap.set("n", "<C-d>", api.fs.remove, get_opts("Create a file"))
	keymap.set("n", "<C-r>", api.fs.rename, get_opts("Rename"))
	keymap.set("n", "<C-q>", api.tree.close, get_opts("Close"))
	keymap.set("n", "<C-h>", api.tree.change_root_to_parent, get_opts("Go to parent directory"))
	keymap.set("n", "h", api.node.navigate.parent_close, get_opts("Go to parent directory"))
end

return {
	{
		enabled = false,
		"folke/flash.nvim",
		---@type Flash.Config
		opts = {
			search = {
				forward = true,
				multi_window = false,
				wrap = false,
				incremental = true,
			},
		},
	},

	{
		"echasnovski/mini.hipatterns",
		event = "BufReadPre",
		opts = {
			highlighters = {
				hsl_color = {
					pattern = "hsl%(%d+,? %d+,? %d+%)",
					group = function(_, match)
						local utils = require("cattynip.utils")
						local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
						h, s, l = tonumber(h), tonumber(s), tonumber(l)
						local hex_color = utils.hslToHex(h, s, l)
						return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
					end,
				},
			},
		},
	},

	{
		"dinhhuy258/git.nvim",
		event = "BufReadPre",
		opts = {
			keymaps = {
				blame = "<Leader>gb",
				browse = "<Leader>go",
			},
		},
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			sort_by = "case_sensitive",
			view = {
				width = {
					min = 25,
					max = 25,
				},
				debounce_delay = 2000,
			},
			renderer = {
				group_empty = false,
			},
			filters = {
				dotfiles = false,
				git_clean = false,
			},
			diagnostics = {
				enable = true,
				show_on_dirs = true,
				debounce_delay = 200,
			},
			actions = {
				expand_all = {
					max_folder_discovery = 10,
					exclude = {
						".git",
						"node_modules",
						"dist",
					},
				},
			},
			on_attach = nvim_on_attach,
		},
	},

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
				"<leader>nt",
				"<cmd>NvimTreeToggle<Return>",
				"Nvim Tree: Open Nvim Tree",
			},

			{
				"<leader>nf",
				"<cmd>NvimTreeFocus<Return>",
				"Nvim Tree: Focus Nvim Tree",
			},

			{
				"<leader>fd",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "[F]ind [D]iagnostics",
			},

			{
				"<leader>fb",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "[F]ind [B]uffers",
			},

			{
				"<leader>ff",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = true,
						layout_strategy = "horizontal",
						initial_mode = "normal",
						layout_config = { width = 130, height = 40 },
					})
				end,
				desc = "[F]ile [F]iles",
			},

			{
				"<leader>fw",
				function()
					local builtin = require("telescope.builtin")

					builtin.current_buffer_fuzzy_find({})
				end,
			},

			{
				"<leader>gc",
				function()
					local builtin = reuiqre("telescope.builtin")

					builtin.git_bcommits({
						git_command = { "git", "log", "--pretty=oneline", "--", "." },
					})
				end,
				"[F]ind [G]it [C]ommits including all commits",
			},

			{
				"<leader>gb",
				function()
					local builtin = require("telescope.builtin")

					builtin.get_branches()
				end,
				"[F]ind [G]it [B]ranches",
			},

			{
				"<leader>gs",
				function()
					local builtin = require("telescope.builtin")

					builtin.git_status({})
				end,
				"[F]ind [G]it [S]tatus",
			},
		},

		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				winblen = 60,
				wrape_results = true,
				prompt_prefix = " ➜ ",
				selection_caret = "➜ ",
				path_display = {
					"smart",
				},
				dynamic_preview_title = true,
				mappings = {
					i = {
						["<C-q>"] = actions.close,
						["<C-c>"] = actions.close,
						["<C-s>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,
						["<C-k>"] = actions.preview_scrolling_up,
						["<C-j>"] = actions.preview_scrolling_down,
						["<C-i>"] = fb_actions.create,
						["<C-d>"] = fb_actions.remove,
						["<C-r>"] = fb_actions.rename,
						["<C-h>"] = fb_actions.goto_parent_dir,
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
						preview_cutoff = 200,
					},
				},
			}
			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					hijack_netrw = true,
				},
			}
			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
		end,
	},
}
