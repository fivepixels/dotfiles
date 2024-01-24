local keymap = vim.keymap

-- Windows
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sl", "<C-w>l")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")

-- Create windows
keymap.set('', 'sv', ':vsplit<Return><C-w>w')
keymap.set('', 'ss', ':split<Return><C-w>w')

-- Resize windows
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Rotate and Equalize windows
keymap.set('', 'sr', '<C-w>r')
keymap.set('', 's=', '<C-w>=')

-- Files

-- Files
keymap.set("n", "su", ":w!<Return>")
keymap.set("n", "sp", ":q!<Return>")
keymap.set('n', 'so', ':source %<Return>')
keymap.set('n', '<C-a>', 'gg<S-v>G')
keymap.set("n", "<leader>s", ":%s/")

-- Move the documents
keymap.set('n', '<C-u>', "<C-u>zz")
keymap.set('n', '<C-d>', "<C-d>zz")

-- Copy and Past
keymap.set('x', 'p', "\"_dP")
keymap.set('n', 'y', '\"+y')
keymap.set('v', 'y', '\"+y')
keymap.set('n', 'Y', '\"+Y')

-- Re-set the Escape key
keymap.set('i', '<C-c>', "<Esc>")

keymap.set('n', '<leader>ll', '<cmd>Lazy<CR>')
keymap.set('n', '<leader>mm', '<cmd>Mason<CR>')

-- Switch between tabs
keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>')
keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>')

-- Create and Remove tabs
keymap.set('n', 'tn', ':tabnew<Return>')
keymap.set('n', 'tx', ':tabclose<Return>')

keymap.set("n", "<leader>nt", "<cmd>NvimTreeToggle<CR>", { desc = "Open Nvim" })
keymap.set("n", "<leader>nf", "<cmd>NvimTreeFocus<CR>", { desc = "Focus Nvim" })

keymap.set('n', '<leader>lf', '<Cmd>Lspsaga finder<CR>')
keymap.set('n', '<leader>lp', '<Cmd>Lspsaga peek_type_definition<CR>')
keymap.set('n', '<leader>lg', '<Cmd>Lspsaga goto_definition<CR>')
keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>')
keymap.set('n', '<leader>lr', '<Cmd>Lspsaga rename<CR>')
keymap.set('n', '<C-n>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
keymap.set('n', '<C-p>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>')
keymap.set('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
  { noremap = true, silent = true, desc = "Lspsaga: [L]spsaga Signature Help" })
keymap.set({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>",
  { noremap = true, silent = true, desc = "Lspsaga: [L]spsaga [C]ode Action" })

-- keymap.set('n', '<C-n>', function()
--   diagnostic:goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap.set('n', '<C-p>', function()
--   diagnostic:goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
