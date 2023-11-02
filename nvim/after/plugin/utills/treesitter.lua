local status, treesitter = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

-- https://github.com/nvim-treesitter/nvim-treesitter

-- Configure Treesitter
treesitter.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "fish",
    "bash",
    "lua",
    "json",
    "toml",
    "yaml",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "dart",
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
