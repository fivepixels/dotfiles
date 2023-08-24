local status, lazy = pcall(require, 'lazy')
if (not status) then return end

-- https://github.com/folke/lazy.nvim

-- Configure Lazy
lazy.setup({
  -- LSP Configuration
  "neovim/nvim-lspconfig",

  -- Mason Families
  "williamboman/mason.nvim", -- Managers for LSP servers, DAP servers, Linters and Fomatters
  "williamboman/mason-lspconfig.nvim", -- LSP Servers
  "mfussenegger/nvim-dap", -- DAP Servers
  "rcarriga/nvim-dap-ui", -- UI for DAP
  "mfussenegger/nvim-lint", -- Linter
  "mhartington/formatter.nvim", -- Formatter

  -- Autocompletions
  "hrsh7th/nvim-cmp",
  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "rafamadriz/friendly-snippets",
  "onsails/lspkind.nvim",

  -- File Explorers
  "nvim-telescope/telescope.nvim",
  "BurntSushi/ripgrep",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-tree/nvim-tree.lua",

  -- Telescope Extensions
  "nvim-telescope/telescope-file-browser.nvim", -- File Browser
  "barrett-ruth/telescope-http.nvim", -- Https Status Codes Dictionary

  -- Mapping Suggestion
  "folke/which-key.nvim",

  -- Style Managements
  "folke/tokyonight.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-treesitter/nvim-treesitter",
  "akinsho/nvim-bufferline.lua",
  "lukas-reineke/indent-blankline.nvim",
  "norcalli/nvim-colorizer.lua",
  "tjdevries/colorbuddy.nvim",
  "nvimdev/lspsaga.nvim",

  -- Commenting
  "numToStr/Comment.nvim",

  -- Automatic Pairation
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",

  -- Git Management
  "dinhhuy258/git.nvim",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",
})
