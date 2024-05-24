local map = vim.keymap.set

vim.cmd([[ mapclear ]])

map("n", "sh", "<C-w>h", { desc = "Move to the left window" })
map("n", "sj", "<C-w>j", { desc = "Move to the lower window" })
map("n", "sk", "<C-w>k", { desc = "Move to the upper window" })
map("n", "sl", "<C-w>l", { desc = "Move to the right window" })
map("n", "ss", "<cmd>split<cr>", { desc = "Split a window horizontally" })
map("n", "sv", "<cmd>vsplit<cr>", { desc = "Split a window vertically" })
map("n", "sr", "<C-w>r", { desc = "Switch windows" })

map("n", "<C-t>", "<cmd>tabedit<cr>")
map("n", "<Tab>", "<cmd>bnext<cr>")
map("n", "<S-Tab>", "<cmd>bprev<cr>")

map("n", "su", "<cmd>w!<cr>", { desc = "Force Write" })
map("n", "sp", "<cmd>q!<cr>", { desc = "Force Quit" })
map("n", "so", "<cmd>source %<cr>", { desc = "Source the current file" })

map("n", "<C-a>", "gg<S-v>G")
map("n", "<leader>r", ":%s/", { desc = "Search and replace" })

map("n", "<leader>lR", "<cmd>LspRestart<cr>", { desc = "Restart the current attached lsp" })

map("n", "y", '"+y')
map("v", "y", '"+y')
map("n", "Y", '"+Y')
map("x", "p", '"_dP')

map("n", "<S-j>", "<cmd>+9<cr>")
map("v", "<S-j>", "<cmd>+9<cr>")
map("n", "<S-k>", "<cmd>-7<cr>")
map("v", "<S-k>", "<cmd>-7<cr>")

map("i", "<C-h>", "<Left>")
map("i", "<C-j>", "<Down>")
map("i", "<C-k>", "<Up>")
map("i", "<C-l>", "<Right>")

map("i", "<C-b>", "<esc>b")
map("i", "<C-w>", "<esc>w")
map("i", "<C-u>", "<esc>u")
map("i", "<C-o>", "<esc>O")
map("i", "<C-Enter>", "<esc>o")

map("n", "<C-u>", "<cmd>DepsClean<cr><cmd>w<cr><cmd>DepsUpdate<cr><cmd>w<cr>")
map("n", "<leader>cp", "<cmd>MarkdownPreview<cr>")
