vim.cmd [[packadd packer.nvim]]

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'nvimtools/none-ls.nvim'
  use 'williamboman/mason.nvim'
  use 'folke/trouble.nvim'
  use 'stevearc/aerial.nvim'
  use 'SmiteshP/nvim-navic'
  use 'simrat39/symbols-outline.nvim'

  -- CMP
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind.nvim'

  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-fzf-native.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  -- MINIs
  use 'echasnovski/mini.pairs'
  use 'echasnovski/mini.surround'
  use 'echasnovski/mini.comment'
  use 'echasnovski/mini.ai'
  use 'echasnovski/mini.indentscope'
  use 'echasnovski/mini.files'
  use 'echasnovski/mini.starter'
  use 'echasnovski/mini.hipatterns'

  -- Searching
  use 'folke/flash.nvim'
  use 'ggandor/flit.nvim'

  -- Typescript
  use 'windwp/nvim-ts-autotag'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  -- Comments
  use 'folke/todo-comments.nvim'
  use 'nvim-neo-tree/neo-tree.nvim'
  use 'numToStr/Comment.nvim'

  -- UI
  use 'nvim-tree/nvim-web-devicons'
  use 'stevearc/dressing.nvim'
  use 'akinsho/bufferline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'MunifTanjim/nui.nvim'

  -- Treesitter
  use 'nvim-treesitter/nvim-treesitter'
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Extra
  use 'tpope/vim-repeat'
  use 'lewis6991/gitsigns.nvim'
  -- use 'RRethy/vim-illuminate'
  use 'ahmedkhalf/project.nvim'
end)

