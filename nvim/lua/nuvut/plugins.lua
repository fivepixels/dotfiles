local path_package = vim.fn.stdpath("data") .. "/site/"
local mini_path = path_package .. "pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  local clone_cmd = {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/echasnovski/mini.nvim",
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd("packadd mini.nvim | helptags ALL")
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

require("mini.deps").setup({ path = { package = path_package } })

local add = MiniDeps.add

add("echasnovski/mini.nvim")
add("nvim-tree/nvim-web-devicons")
add("craftzdog/solarized-osaka.nvim")

add("nvim-treesitter/nvim-treesitter")
add("nvim-treesitter/nvim-treesitter-context")
add("JoosepAlviste/nvim-ts-context-commentstring")

add("neovim/nvim-lspconfig")
add("williamboman/mason.nvim")
add("williamboman/mason-lspconfig.nvim")
add("nvimdev/lspsaga.nvim")
add("stevearc/conform.nvim")
add("mfussenegger/nvim-lint")

add("hrsh7th/nvim-cmp")
add("hrsh7th/cmp-nvim-lsp")
add("hrsh7th/cmp-path")
add("hrsh7th/cmp-buffer")
add("hrsh7th/cmp-cmdline")
add("saadparwaiz1/cmp_luasnip")
add("L3MON4D3/LuaSnip")
add("rafamadriz/friendly-snippets")

add("nvim-telescope/telescope.nvim")
add("nvim-telescope/telescope-file-browser.nvim")
add("akinsho/bufferline.nvim")
add("nvim-neo-tree/neo-tree.nvim")

add("roobert/tailwindcss-colorizer-cmp.nvim")
add("windwp/nvim-ts-autotag")
add("Wansmer/treesj")
add("MunifTanjim/nui.nvim")
add("nvim-lua/plenary.nvim")

add("b0o/SchemaStore.nvim")
add("prisma/vim-prisma")
add("iamcco/markdown-preview.nvim")
