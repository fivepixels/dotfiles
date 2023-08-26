local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

-- https://github.com/nvim-treesitter/nvim-treesitter

-- Configure Treesitter
ts.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "bash",
    "fish",
    "php",
    "lua",
    "json",
    "toml",
    "yaml",
    "swift",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline"
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
