local map = vim.keymap.set

vim.cmd([[ mapclear ]])

-- tab
map("n", "<leader>te", "<cmd>tabedit<cr>")
map("n", "<leader>tq", "<cmd>tabclose<cr>")
map("n", "<Tab>", "<cmd>tabnext<cr>")
map("n", "<S-Tab>", "<cmd>tabprev<cr>")

-- window
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")
map("n", "ss", "<cmd>split<cr><C-w>w")
map("n", "sv", "<cmd>vsplit<cr><C-w>w")

-- document
map("n", "su", "<cmd>w!<cr>")
map("n", "sp", "<cmd>q!<cr>")
map("n", "so", "<cmd>source %<cr>")

map("n", "<C-a>", "gg<S-v>G")

map("n", "<leader>s", ":%s/")
map("n", "y", '"+y')
map("v", "y", '"+y')
map("n", "Y", '"+Y')
map("x", "p", '"_dP')

map("n", "<leader>rs", "qq")
map("n", "<leader>rf", "q")
map("n", "<leader>ra", "@q")

map("v", "<C-j>", ":m '>+1<cr>gv=gv")
map("v", "<C-k>", ":m '<-2<cr>gv=gv")
map("v", "<C-l>", "%")
map("v", "<C-h>", "^")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", "<C-h>", "<esc>hi")
map("i", "<C-j>", "<esc>ji")
map("i", "<C-k>", "<esc>ki")
map("i", "<C-l>", "<esc>li")

map("i", "<C-i>", "<esc>I")
map("i", "<C-a>", "<esc>A")
map("i", "<C-d>", "<bs>")
map("i", "<C-o>", "<esc>o")

map("i", "<C-w>", "<esc>lwi")
map("i", "<C-b>", "<esc>hbi")

map("n", "<S-l>", "$")
map("n", "<S-h>", "^")
map("n", "<S-j>", "<cmd>+8<cr>")
map("n", "<S-k>", "<cmd>-8<cr>")

-- managers
map("n", "<leader>mj", "<cmd>Pckr status<cr>")
map("n", "<leader>mm", "<cmd>Mason<cr>")

-- disable cursors
map({ "", "i" }, "<up>", "<nop>")
map({ "", "i" }, "<down>", "<nop>")
