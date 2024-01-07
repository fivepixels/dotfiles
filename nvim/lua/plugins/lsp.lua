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
        "css-lsp",
        "sqlls",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        eslint = {},
        cssls = {},
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git")(...)
          end,
          single_file_support = true,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
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
        dartls = {},
        sqlls = {
          settings = {
            connections = {
              {
                name = "sql-language-server",
                adapter = "mysql",
                host = "localhost",
                port = 3307,
                user = "username",
                password = "password",
                database = "mysql-development",
                projectPaths = { "/Users/joe-re/src/sql-language-server" },
                ssh = {
                  user = "ubuntu",
                  remoteHost = "ec2-xxx-xxx-xxx-xxx.ap-southeast-1.compute.amazonaws.com",
                  dbHost = "127.0.0.1",
                  port = 3306,
                  identityFile = "~/.ssh/id_rsa",
                  passphrase = "123456",
                },
              },
              {
                name = "postgres-project",
                adapter = "postgres",
                host = "localhost",
                port = 5432,
                user = "postgres",
                password = "pg_pass",
                database = "pg_test",
                projectPaths = { "/Users/joe-re/src/postgres_project" },
              },
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
                setType = true,
                paramType = true,
                paramName = "Enable",
                semicolon = "Enable",
                arrayIndex = "Enable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                enable = true,
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
                enable = true,
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
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            client.server_capabilities.documentFormattingProvider = true
          end)
        end,
      },
    },
  },

  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      ui = {
        border = "rounded",
        code_action = " ",
        keys = {
          scroll_up = "<C-u>",
          scroll_down = "<C-d>",
        },
      },
      symbol_in_winbar = {
        enable = true,
      },
      definition = {
        keys = {
          edit = "<CR>",
          vsplit = "v",
          split = "s",
          tabe = "t",
          quit = "q",
          close = "<C-c>",
        },
      },
      diagnostic = {
        extend_relatedInformation = true,
        keys = {
          exec_action = "<CR>",
          toggle_or_jump = "<C-t>",
          quit = "q",
          quit_in_show = "",
        },
      },
      finder = {
        max_height = 1,
        left_width = 0.2,
        right_width = 0.6,
        keys = {
          toggle_or_open = "<CR>",
          vsplit = "v",
          split = "s",
          tabe = "t",
          tabnew = "t",
          close = "<C-c>",
          quit = "q",
          shuttle = "r",
        },
      },
      hover_doc = {
        open_link = "<C-w>e",
        open_cmd = "!chrome",
      },
      lightbulb = {
        enable = false,
      },
      rename = {
        in_select = false,
        auto_save = true,
        keys = {
          quit = "q",
          select = "s",
        },
      },
      outline = {
        close_after_jump = true,
        keys = {
          jump = "i",
        },
      },
    },
  },
}
