local status_for_mason, mason = pcall(require, "mason")
local status_for_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
local status_for_flutter, flutter = pcall(require, "flutter-tools");
if (not status_for_mason or not status_for_mason_lspconfig or not status_for_flutter) then return end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- https://github.com/williamboman/mason.nvim#installation
-- https://github.com/akinsho/flutter-tools.nvim

-- The servers that are running on NVIM
local servers = {
  gopls = {},
  pyright = {},
  tsserver = {
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
  },
  html = { filetypes = { 'html', 'twig', 'hbs' } },
  cssls = {
    less = {
      validate = true
    }
  },
  cssmodules_ls = {},
  diagnosticsls = {},
  dotls = {},
  graphql = {},
  jsonls = {},
  sqlls = {},
  tailwindcss = {
    filetypes = {
      "astro",
      "astro-markdown",
      "html",
      "markdown",
      "css",
      "less",
      "postcss",
      "sass",
      "scss",
      "rescript",
      "typescript",
      "typescriptreact"
    }
  },
  vimls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = true },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
}

-- The servers that MUST BE Installed
local ensure_installed_servers = {
  "bashls",
  "cssls",
  "cssmodules_ls",
  "diagnosticls",
  "dotls",
  "grammarly",
  "graphql",
  "html",
  "jsonls",
  "lua_ls",
  "pyright",
  "sqlls",
  "tailwindcss",
  "tsserver",
  "vimls",
}

-- The function that allows you to format the file automatically when you save a file.
local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
  vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup_format,
    buffer = bufnr,
    callback = function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end,
  })
end

-- The function that set the keymaps for us automatically
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')

  nmap('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  enable_format_on_save()

  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Mason Configuration
mason.setup({
  automatic_installations = true,
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Mason Lspconfig Configuration
mason_lspconfig.setup {
  ensure_installed = ensure_installed_servers,
  automatic_installation = false,
}

-- Add the servers based on teh servers variable
mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,
}

flutter.setup {
  ui = {
    border = "rounded",
    notification_style = 'native'
  },
  decorations = {
    statusline = {
      app_version = true,
      device = true,
      project_config = true,
    }
  },
  debugger = {
    enabled = true,
    run_via_dap = true,
    exception_breakpoints = {},
  },
  root_patterns = { "README.md", ".git", "pubspec.yaml" },
  fvm = false,
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    prefix = '> ',
    enabled = true
  },
  dev_log = {
    enabled = true,
    notify_errors = true,
    open_cmd = "tabedit",
  },
  dev_tools = {
    autostart = true,
    auto_open_browser = true,
  },
  outline = {
    open_cmd = "10vnew",
    auto_open = false,
  },
  lsp = {
    color = {
      enabled = true,
      background = true,
      background_color = { r = 33, g = 38, b = 55 },
      foreground = false,
      virtual_text = true,
      virtual_text_str = "■",
    },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      enableSdkFormatter = true,
      showTodos = true,
      renameFilesWithClasses = "always",
      enableSnippets = true,
      updateImportsOnRename = true,
      documentation = "summary",
      includeDependenciesInWorkspaceSymbols = true,
    }
  }
}

vim.cmd [[
  augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
  augroup END
]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
