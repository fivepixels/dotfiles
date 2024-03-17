local cmp = require("cmp")
local defaults = require("cmp.config.default")()
local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")

require("cmp_nvim_ultisnips").setup({})

vim.cmd([[
  let g:UltiSnipsExpandTrigger="<Tab>"
  let g:UltiSnipsJumpForwardTrigger="<C-h>"
  let g:UltiSnipsJumpBackwardTrigger="<C-l>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"
]])

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

local lspkind_comparator = function(conf)
	local lsp_types = require("cmp.types").lsp
	return function(entry1, entry2)
		if entry1.source.name ~= "nvim_lsp" then
			if entry2.source.name == "nvim_lsp" then
				return false
			else
				return nil
			end
		end
		local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
		local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]

		local priority1 = conf.kind_priority[kind1] or 0
		local priority2 = conf.kind_priority[kind2] or 0
		if priority1 == priority2 then
			return nil
		end
		return priority2 < priority1
	end
end

local label_comparator = function(entry1, entry2)
	return entry1.completion_item.label < entry2.completion_item.label
end

cmp.setup({
	completion = {
		completeopt = "menuone,preview,noinsert",
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		["<C-k>"] = cmp.mapping.scroll_docs(-4),
		["<C-j>"] = cmp.mapping.scroll_docs(4),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<S-CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
		end, {
			"i",
			"s",
			"c",
		}),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			cmp_ultisnips_mappings.jump_backwards(fallback)
		end, {
			"i",
			"s",
			"c",
		}),
	}),
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	sources = cmp.config.sources({
		{ name = "ultisnips", score = 5 },
		{ name = "nvim_lsp", score = 4 },
		{ name = "path", score = 3 },
	}, {
		{ name = "buffer" },
	}),
	formatting = {
		format = function(entry, item)
			-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/init.lua#L53
			local icons = {
				Array = " ",
				Boolean = "󰨙 ",
				Class = " ",
				Codeium = "󰘦 ",
				Color = " ",
				Control = " ",
				Collapsed = " ",
				Constant = "󰏿 ",
				Constructor = " ",
				Copilot = " ",
				Enum = " ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = " ",
				Folder = " ",
				Function = "󰊕 ",
				Interface = " ",
				Key = " ",
				Keyword = " ",
				Method = "󰊕 ",
				Module = " ",
				Namespace = "󰦮 ",
				Null = " ",
				Number = "󰎠 ",
				Object = " ",
				Operator = " ",
				Package = " ",
				Property = " ",
				Reference = " ",
				Snippet = " ",
				String = " ",
				Struct = "󰆼 ",
				TabNine = "󰏚 ",
				Text = " ",
				TypeParameter = " ",
				Unit = " ",
				Value = " ",
				Variable = "󰀫 ",
			}

			if icons[item.kind] then
				item.kind = icons[item.kind] .. string.upper(string.sub(item.kind, 1, 4))
			end

			return require("tailwindcss-colorizer-cmp").formatter(entry, item)
		end,
	},
	experimental = {
		ghost_text = {
			hl_group = "CmpGhostText",
		},
	},
	sorting = {
		comparators = {
			lspkind_comparator({
				kind_priority = {
					Field = 13,
					Property = 11,
					Constant = 10,
					Enum = 10,
					EnumMember = 10,
					Event = 10,
					Function = 11,
					Method = 11,
					Operator = 10,
					Reference = 10,
					Struct = 10,
					Variable = 12,
					File = 8,
					Folder = 8,
					Class = 5,
					Color = 5,
					Module = 5,
					Keyword = 2,
					Constructor = 1,
					Interface = 1,
					Snippet = 12,
					Text = 1,
					TypeParameter = 1,
					Unit = 1,
					Value = 1,
				},
			}),
			label_comparator,
		},
	},
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
})

cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "git" },
	}, {
		{ name = "buffer" },
	}),
})

cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

vim.keymap.set("n", "<leader>ue", "<cmd>UltiSnipsEdit<cr>")

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
-- 	mapping = cmp.mapping.preset.cmdline(),
-- 	sources = cmp.config.sources({
-- 		{ name = "path" },
-- 	}, {
-- 		{ name = "cmdline" },
-- 	}),
-- })
