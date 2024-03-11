vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/pckr/pckr.nvim")

require('pckr').add({
  -- basic
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  -- coding
  "neovim/nvim-lspconfig",
  "nvimtools/none-ls.nvim",
  "williamboman/mason.nvim",
  "hrsh7th/nvim-cmp",
  "mfussenegger/nvim-lint",
  "stevearc/conform.nvim",

  "L3MON4D3/LuaSnip",
  "echasnovski/mini.pairs",
  "echasnovski/mini.surround",
  "echasnovski/mini.ai",
  "echasnovski/mini.comment",
  "JoosepAlviste/nvim-ts-context-commentstring",

  "lewis6991/gitsigns.nvim",

  -- editing
  "nvim-neo-tree/neo-tree.nvim",
  "nvim-telescope/telescope.nvim",
  "RRethy/vim-illuminate",
  "folke/todo-comments.nvim",
  "windwp/nvim-ts-autotag",
  "hedyhli/outline.nvim",
  "SmiteshP/nvim-navic",
  "stevearc/aerial.nvim",

  -- ui
  "craftzdog/solarized-osaka.nvim",
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",
  "akinsho/bufferline.nvim",
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "nvimdev/dashboard-nvim",

  -- language specific
  "wookayin/semshi",              -- python
  "mrcjkb/rustaceanvim",          -- rust
  "mfussenegger/nvim-jdtls",      -- java
  "b0o/SchemaStore.nvim",         -- json
  "iamcco/markdown-preview.nvim", -- markdown
})
