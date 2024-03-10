local map = vim.keymap.set

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

map("n", "<C-j>", "<cmd>+8<cr>")
map("n", "<C-k>", "<cmd>-8<cr>")

map("v", "<", "<gv")
map("v", ">", ">gv")

-- managers
map("n", "<leader>ml", "<cmd>Lazy<cr>")
map("n", "<leader>mm", "<cmd>Mason<cr>")

-- disable cursors
map({ "", "i" }, "<up>", "<nop>")
map({ "", "i" }, "<down>", "<nop>")
