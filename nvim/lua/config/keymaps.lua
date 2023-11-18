local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

vim.keymap.del("n", "s")
vim.keymap.del("n", "f")
vim.keymap.del("n", "t")
map("i", "<C-c>", "<Esc>")

-- Move between Windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Create Windows
map("n", "<C-c>s", "<C-W>s", { desc = "[C]reate window [S]plit", remap = true })
map("n", "<C-c>v", "<C-W>v", { desc = "[C]reate window [V]split", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "x", "n", "s" }, "<C-q>", "<cmd>q<cr><esc>", { desc = "Save file" })

-- Move Lines
map("n", "<leader>mj", "<cmd>m .+1<cr>==", { desc = "[M]ove " })
map("n", "<leader>mk", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<leader>mj", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<leader>mk", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Select All Lines
map("n", "<C-a>", "gg<S-v>G", { desc = "Select All" })

-- Move Documents
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

-- Tabs
map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<S-Tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Better Copying and Pasting
map("x", "p", '"_dP')
map("n", "y", '"+y')
map("v", "y", '"+y')
map("n", "Y", '"+Y')

-- formatting
map({ "n", "v" }, "<leader>cf", function()
  Util.format({ force = true })
end, { desc = "Format" })

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity })
  end
end
map("n", "<C-n>", diagnostic_goto(true), { desc = "Next Diagnostic" })
map("n", "<C-p>", diagnostic_goto(false), { desc = "Prev Diagnostic" })

-- stylua: ignore start

-- floating terminal
local lazyterm = function() Util.terminal(nil, { cwd = Util.root() }) end
map("n", "<leader>tr", lazyterm, { desc = "[T]erminal [R]oot" })
map("n", "<leader>tc", function() Util.terminal() end, { desc = "[T]erminal [C]wd" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Lazy & Mason
map('n', '<leader>ll', '<cmd>Lazy<CR>')
map('n', '<leader>mm', '<cmd>Mason<CR>')
