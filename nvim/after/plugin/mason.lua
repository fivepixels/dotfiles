local status_for_mason, mason = pcall(require, "mason")
local status_for_mason_lspconfig, mason_lspconfig = pcall(require, 'mason-lspconfig')
if (not status_for_mason or not status_for_mason_lspconfig) then return end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- https://github.com/williamboman/mason.nvim#installation

-- The servers that are running on NVIM
local servers = {
  gopls = {},
  pyright = {},
  tsserver = {},
  html = { filetypes = { 'html', 'twig', 'hbs'} },
  cssls = {},
  cssmodules_ls = {},
  diagnosticsls = {},
  dotls = {},
  eslint = {},
  graphql = {},
  jsonls = {},
  sqlls = {},
  tailwindcss = {},
  vimls = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = true },
      diagnostics = {
        globals = {'vim'},
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
  "eslint",
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

-- The function that set the keymaps for us automatically
local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('<leader>gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('<leader>gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')

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
  automatic_installation = true,
  diagnostics = { globals = { 'vim' } }
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
  end
}
