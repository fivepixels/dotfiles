local status, lazy = pcall(require, 'lazy')
if (not status) then return end

-- https://github.com/folke/lazy.nvim

-- Configure Lazy
lazy.setup({
  -- LSP
  "neovim/nvim-lspconfig",
  "nvimtools/none-ls.nvim",
  "L3MON4D3/LuaSnip",
  "mfussenegger/nvim-lint",
  "mhartington/formatter.nvim",

  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",

  -- Autocompletions
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "onsails/lspkind.nvim",

  -- File Explorers
  "nvim-telescope/telescope.nvim",
  "BurntSushi/ripgrep",
  "nvim-lua/plenary.nvim",
  "nvim-telescope/telescope-fzf-native.nvim",
  "nvim-tree/nvim-tree.lua",

  -- Telescope Extensions
  "nvim-telescope/telescope-file-browser.nvim",
  "barrett-ruth/telescope-http.nvim",

  -- Mapping Suggestion
  "folke/which-key.nvim",

  -- Style Managements
  'svrana/neosolarized.nvim',
  'tjdevries/colorbuddy.nvim',
  "nvim-lualine/lualine.nvim",
  "nvim-tree/nvim-web-devicons",
  "nvim-treesitter/nvim-treesitter",
  "akinsho/nvim-bufferline.lua",
  "norcalli/nvim-colorizer.lua",
  "tjdevries/colorbuddy.nvim",
  "nvimdev/lspsaga.nvim",
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
  },

  -- Commenting
  "numToStr/Comment.nvim",
  "JoosepAlviste/nvim-ts-context-commentstring",

  -- Automatic Pairation
  "windwp/nvim-autopairs",
  "windwp/nvim-ts-autotag",

  -- Git Management
  "dinhhuy258/git.nvim",
  "lewis6991/gitsigns.nvim",
  "sindrets/diffview.nvim",

  -- Flutter
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
  }
})
