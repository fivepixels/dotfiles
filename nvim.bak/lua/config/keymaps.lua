local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "<C-c>", "<Esc>")

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

keymap.set("n", "tn", "<cmd>tabedit<cr>")
keymap.set("n", "tx", "<cmd>tabclose<cr>")
-- keymap.set("n", "<Tab>", "<cmd>tabnext<cr>", opts)
-- keymap.set("n", "<s-Tab>", "<cmd>tabprev<cr>", opts)
keymap.set("n", "su", "<cmd>w!<cr>", opts)
keymap.set("n", "sp", "<cmd>q!<cr>", opts)
keymap.set("n", "so", "<cmd>source %<cr>", opts)
keymap.set("n", "ss", "<cmd>split<cr>", opts)
keymap.set("n", "sv", "<cmd>vsplit<cr>", opts)
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

keymap.set("x", "p", '"_dP')
keymap.set("n", "y", '"+y')
keymap.set("v", "y", '"+y')
keymap.set("n", "Y", '"+Y')

keymap.set("n", "<leader>ll", "<cmd>Lazy<CR>")
keymap.set("n", "<leader>mm", "<cmd>Mason<CR>")

-- Diagnostics
keymap.set("n", "<C-j>", function()
	vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<C-p", function()
	vim.diagnostic.goto_prev()
end)
