vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/pckr/pckr.nvim")

require("pckr").add({
  -- basic
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  -- coding

  -- language servers
  "neovim/nvim-lspconfig",
  "nvimdev/lspsaga.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "mason-org/mason-registry",

  -- dap
  "mfussenegger/nvim-dap",
  "rcarriga/nvim-dap-ui",
  "nvim-neotest/nvim-nio",
  "theHamsta/nvim-dap-virtual-text",
  "jay-babu/mason-nvim-dap.nvim",

  -- completion
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",

  "L3MON4D3/LuaSnip",
  "saadparwaiz1/cmp_luasnip",
  "rafamadriz/friendly-snippets",

  -- linting and formatting
  "mfussenegger/nvim-lint",
  "stevearc/conform.nvim",
  "ThePrimeagen/refactoring.nvim",

  -- minis
  "echasnovski/mini.pairs",
  "echasnovski/mini.surround",
  "echasnovski/mini.indentscope",
  "echasnovski/mini.ai",
  "echasnovski/mini.comment",
  "folke/todo-comments.nvim",
  "echasnovski/mini.hipatterns",
  "JoosepAlviste/nvim-ts-context-commentstring",

  "sindrets/diffview.nvim",
  "lewis6991/gitsigns.nvim",

  -- editor
  "nvim-neo-tree/neo-tree.nvim",
  "akinsho/bufferline.nvim",
  "nvim-lualine/lualine.nvim",

  -- telescope
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-file-browser.nvim",

  -- ui
  "craftzdog/solarized-osaka.nvim",
  "lukas-reineke/indent-blankline.nvim",

  -- treesitter
  "nvim-treesitter/nvim-treesitter",
  "nvim-treesitter/nvim-treesitter-context",

  -- language specific
  "b0o/SchemaStore.nvim",                   -- json
  "roobert/tailwindcss-colorizer-cmp.nvim", -- tailwindcss
  "mrcjkb/rustaceanvim",                    -- rust
  "Saecki/crates.nvim",                     -- rust
  "iamcco/markdown-preview.nvim",
})
