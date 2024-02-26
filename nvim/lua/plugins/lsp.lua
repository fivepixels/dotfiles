return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "astro-language-server",
        "css-lsp",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        cssls = {},
        astro = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = false,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {},
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    keys = {
      {
        "<leader>lc",
        "<cmd>Lspsaga code_action<cr>",
        desc = "plugin > lspsaga: code actions",
      },
      {
        "<leader>ld",
        "<cmd>Lspsaga peek_definition<cr>",
        desc = "plugin > lspsaga: go to definition",
      },
      {
        "<C-n>",
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        desc = "plugin > lspsaga: jump to the next diagnostic",
      },
      {
        "<C-p>",
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        desc = "plugin > lspsaga: jump to the previous diagnostic",
      },
      {
        "<leader>lf",
        "<cmd>Lspsaga finder<cr>",
        desc = "plugin > lspsaga: open a finder",
      },
      {
        "<leader>lh",
        "<cmd>Lspsaga hover_doc<cr>",
        desc = "plugin > lspsaga: open a hover doc",
      },
      {
        "<leader>lr",
        "<cmd>Lspsaga rename<cr>",
        desc = "plugin > lspsaga: rename a variable",
      },
    },
    opts = {
      breadcrumbs = {
        enable = true,
      },
      callhierarchy = {
        keys = {
          edit = "<C-e>",
          vsplit = "<C-v>",
          split = "<C-s>",
          tabe = "<C-t>",
          quit = "q",
          shuttle = "<C-r>",
          toggle_or_req = "u",
          close = "<C-c>",
        },
      },
      code_action = {
        num_shortcut = false,
        show_server_name = true,
        extend_gitsigns = true,
      },
      definition = {
        keys = {
          edit = "<C-e>",
          vsplit = "<C-v>",
          split = "<C-s>",
          tabe = "<C-t>",
          quit = "q",
          close = "<C-c>",
        },
      },
      diagnostic = {
        extend_relatedInformation = true,
      },
      finder = {
        default = "tyd+def+ref+imp",
        open_link = "<C-i>",
        keys = {
          shuttle = "<C-r>",
          toggle_or_open = "<cr>",
          vsplit = "<C-v>",
          split = "<C-s>",
          tabe = "<C-t>",
          tabnew = "<C-t>",
          quit = "q",
          close = "<C-c>",
        },
      },
      rename = {
        auto_save = true,
        keys = {
          quit = "<C-c>",
        },
      },
      ui = {
        expand = "",
        collapse = "",
        code_action = " ",
        actionfix = "",
        lines = { "╰", "┣", "│", "─", "╭" },
      },
    },
  },
}
