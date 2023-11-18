local Util = require("lazyvim.util")

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

	-- File Explorer
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		keys = {
			{
				"<leader>e",
				false,
			},

			{
				"<leader>fe",
				function()
					require("neo-tree.command").execute({ toggle = true, dir = Util.root() })
				end,
				desc = "Explorer NeoTree (root dir)",
			},

			{
				"<leader>ge",
				function()
					require("neo-tree.command").execute({ source = "git_status", toggle = true })
				end,
				desc = "Git explorer",
			},
		},
		deactivate = function()
			vim.cmd([[Neotree close]])
		end,
		init = function()
			if vim.fn.argc(-1) == 1 then
				local stat = vim.loop.fs_stat(vim.fn.argv(0))
				if stat and stat.type == "directory" then
					require("neo-tree")
				end
			end
		end,
		opts = {
			sources = { "filesystem", "buffers", "git_status", "document_symbols" },
			open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
			filesystem = {
				bind_to_cwd = false,
				follow_current_file = { enabled = true },
				use_libuv_file_watcher = true,
			},
			window = {
				width = 25,
				mappings = {
					["<space>"] = "none",
					["s"] = "none",
					["<Tab>"] = "none",
					["t"] = "toggle_preview",
					["<C-s>"] = "open_split",
					["<C-v>"] = "open_vsplit",
					["<C-t>"] = "open_tabnew",
					["<C-i>"] = "add",
					["<C-d>"] = "delete",
					["<C-r>"] = "rename",
					["<C-y>"] = "copy_to_clipboard",
					["<C-m>"] = "move",
					["<C-q>"] = "close_window",
					["q"] = "close_window",
					["<C-h>"] = "prev_source",
					["<C-l>"] = "next_source",
				},
			},
			default_component_configs = {
				indent = {
					with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
					expander_collapsed = "",
					expander_expanded = "",
					expander_highlight = "NeoTreeExpander",
				},
			},
		},
		config = function(_, opts)
			local function on_move(data)
				Util.lsp.on_rename(data.source, data.destination)
			end

			local events = require("neo-tree.events")
			opts.event_handlers = opts.event_handlers or {}
			vim.list_extend(opts.event_handlers, {
				{ event = events.FILE_MOVED, handler = on_move },
				{ event = events.FILE_RENAMED, handler = on_move },
			})
			require("neo-tree").setup(opts)
			vim.api.nvim_create_autocmd("TermClose", {
				pattern = "*lazygit",
				callback = function()
					if package.loaded["neo-tree.sources.git_status"] then
						require("neo-tree.sources.git_status").refresh()
					end
				end,
			})
		end,
	},
}
