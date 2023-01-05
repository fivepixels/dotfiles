local keymap = vim.keymap

-- Window Controll
keymap.set("n", "su", ":w!<Return>")
keymap.set("n", "sp", ":q!<Return>")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sl", "<C-w>l")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sk", "<C-w>k")
keymap.set('', 'ss', ':split<Return><C-w>w')
keymap.set('', 'sv', ':vsplit<Return><C-w>w')
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
keymap.set('', 'sr', '<C-w>r')
keymap.set('', 's=', '<C-w>=')
keymap.set('n', 'so', ':so<Return>')

-- Select all content in a page
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Increase and decrease
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Page up and down
keymap.set('n', '<C-u>', "<C-u>zz")
keymap.set('n', '<C-d>', "<C-d>zz")

keymap.set('n', 'n', 'nzzzv')
keymap.set('n', 'N', 'Nzzzv')

-- Copy and past
keymap.set('x', 'p', "\"_dP")
keymap.set('n', 'y', '\"+y')
keymap.set('v', 'y', '\"+y')
keymap.set('n', 'Y', '\"+Y')

-- Escape
keymap.set('i', '<C-c>', "<Esc>")

-- Move the cursor
keymap.set('n', '<C-k>', "<cmd>cnext<CR>zz")
keymap.set('n', '<C-j>', "<cmd>cprev<CR>zz")

-- Delete keymap
keymap.set("n", "<leader>s", function() end)
