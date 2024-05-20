local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"

if not vim.loop.fs_stat(mini_path) then
	vim.fn.system("git", "clone", "--filter=blob:none", "https://github.com/echasnovski/mini.nvim", mini_path)
end

require("mini.deps").setup({ path = { package = path_package } })

local add = MiniDeps.add

add("echasnovski/mini.nvim")

add("craftzdog/solarized-osaka.nvim")
add("nvim-treesitter/nvim-treesitter")
add("nvim-tree/nvim-web-devicons")
add("nvim-lualine/lualine.nvim")
add("lewis6991/gitsigns.nvim")

add("neovim/nvim-lspconfig")
add("nvimdev/lspsaga.nvim")
add("stevearc/conform.nvim")
add("mfussenegger/nvim-lint")
add("williamboman/mason.nvim")
add("williamboman/mason-lspconfig.nvim")

add("hrsh7th/nvim-cmp")
add("hrsh7th/cmp-nvim-lsp")
add("L3MON4D3/LuaSnip")

add("nvim-telescope/telescope.nvim")
add("nvim-telescope/telescope-file-browser.nvim")
add("nvim-lua/plenary.nvim")

add("JoosepAlviste/nvim-ts-context-commentstring")
add("roobert/tailwindcss-colorizer-cmp.nvim")
add("b0o/SchemaStore.nvim")
add("iamcco/markdown-preview.nvim")
add("prisma/vim-prisma")
