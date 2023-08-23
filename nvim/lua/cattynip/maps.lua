local keymap = vim.keymap

-- Windows

-- Switch between windows
keymap.set("", "sh", "<C-w>h") -- Left
keymap.set("", "sl", "<C-w>l") -- Right
keymap.set("", "sk", "<C-w>k") -- Up
keymap.set("", "sj", "<C-w>j") -- Down

-- Create windows
keymap.set('', 'sv', ':vsplit<Return><C-w>w') -- Vertically
keymap.set('', 'ss', ':split<Return><C-w>w') -- Horizontally

-- Resize windows
keymap.set('n', '<C-w><left>', '<C-w><') -- Left
keymap.set('n', '<C-w><right>', '<C-w>>') -- Right
keymap.set('n', '<C-w><up>', '<C-w>+') -- Up
keymap.set('n', '<C-w><down>', '<C-w>-') -- Down

-- Rotate and Equalize windows
keymap.set('', 'sr', '<C-w>r') -- Rotate
keymap.set('', 's=', '<C-w>=') -- Equalize

-- Files
keymap.set("n", "su", ":w!<Return>") -- Save
keymap.set("n", "sp", ":q!<Return>") -- Quit
keymap.set('n', 'so', ':source %<Return>') -- Vim setup
keymap.set('n', '<C-a>', 'gg<S-v>G') -- Select ALL Lines of Codes
keymap.set("n", "<leader>s", ":%s/") -- Replace text

-- Move the documents
keymap.set('n', '<C-u>', "<C-u>zz") -- Up
keymap.set('n', '<C-d>', "<C-d>zz") -- Down

-- Optimize copying and pasting
keymap.set('x', 'p', "\"_dP")
keymap.set('n', 'y', '\"+y')
keymap.set('v', 'y', '\"+y')
keymap.set('n', 'Y', '\"+Y')

-- Re-set the Escape key
keymap.set('i', '<C-c>', "<Esc>")

-- Open plugins & LSP/DAP/Linters/Formatters Management UI Programms
keymap.set('n', '<leader>ll', '<cmd>Lazy<CR>') -- Lazy for plugins
keymap.set('n', '<leader>mm', '<cmd>Mason<CR>') -- Mason for LSP/DAP/Linters/Formatters

-- Mapping Lists
--
-- Mason: ~.../nvim/after/plugin/mason.lua
-- Telescope: ~.../nvim/after/plugin/telescope.lua
-- Cmp: ~.../nvim/after/plugin/cmp.lua
-- NvimTree: ~.../nvim/after/plugin/nvimtree.lua
-- Bufferline: ~.../nvim/after/plugin/bufferline.lua
-- Comment: ~.../nvim/after/plugin/comment.lua
-- Diffview: ~.../nvim/after/plugin/diffview.lua
