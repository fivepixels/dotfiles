local map = vim.keymap.set

vim.mapleader = " "
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- tabs
map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "tab: move to the next tab" })
map("n", "<S-Tab>", "<cmd>tabprev<cr>", { desc = "tab: move to the previous tab" })
map("n", "<leader>tp", "<cmd>tabclose<cr>", { desc = "tab: close the current tab" })
map("n", "<leader>tu", "<cmd>tabnew<cr>", { desc = "tab: open up a new tab" })

-- windows
map("n", "sl", "<C-w>l", { desc = "window: go to the right window" })
map("n", "sh", "<C-w>h", { desc = "window: go to the left window" })
map("n", "sk", "<C-w>k", { desc = "window: go to the upper window" })
map("n", "sj", "<C-w>j", { desc = "window: go to the lower window" })
map("n", "ss", "<cmd>split<cr>", { desc = "window: go to the lower window" })
map("n", "sv", "<cmd>vsplit<cr>", { desc = "window: go to the lower window" })
map("n", "s=", "<C-w>=", { desc = "window: equalize all windows" })

-- documents
map("n", "su", "<cmd>w!<cr>", { desc = "document: save the current file" })
map("n", "sp", "<cmd>q!<cr>", { desc = "document: quit from the current file" })
map("n", "sP", "<cmd>qa!<cr>", { desc = "document: quit from the all files" })

map("n", "<C-a>", "gg<S-v>G", { desc = "document: select all lines" })

map("n", "y", '"+y', { desc = "document: better copy" })
map("v", "y", '"+y', { desc = "document: better copy" })
map("n", "Y", '"+Y', { desc = "document: better copy" })
map("x", "p", '"_dP', { desc = "document: better paste" })

map("n", "<S-j>", "<cmd>m .+1<cr>==", { desc = "document: move the selected line down" })
map("n", "<S-k>", "<cmd>m .-2<cr>==", { desc = "document: move the selected line up" })

map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "document: move the selected lines down" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "document: move the selected lines down" })

map("n", "<S-j>", "<cmd>+5<cr>", { desc = "document: go down for five lines" })
map("n", "<S-k>", "<cmd>-5<cr>", { desc = "document: go down for five lines" })

map("v", "<", "<gv", { desc = "document: insert a new indent front" })
map("v", ">", ">gv", { desc = "document: remove an indent from front" })

-- managers
map("n", "<leader>ml", "<cmd>Lazy<cr>", { desc = "managers: open a window for Lazy" })
map("n", "<leader>mm", "<cmd>Mason<cr>", { desc = "managers: open a window for mason" })

-- diagnostic
map("n", "<C-n>", function()
  vim.diagnostic.goto_next()
end, { desc = "diagnostic: go to the next warning or error" })

map("n", "<C-p>", function()
  vim.diagnostic.goto_prev()
end, { desc = "diagnostic: go to the previous warning or error" })
