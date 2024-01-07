local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

map("i", "<C-c>", "<Esc>")

-- Move between Windows
map("n", "sh", "<C-w>h", { desc = "", remap = true })
map("n", "sj", "<C-w>j", { desc = "", remap = true })
map("n", "sk", "<C-w>k", { desc = "", remap = true })
map("n", "sl", "<C-w>l", { desc = "", remap = true })

-- Create Windows
map("n", "ss", "<C-W>s", { desc = "", remap = true })
map("n", "sv", "<C-W>v", { desc = "", remap = true })

-- Save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "", remap = true })
map({ "i", "x", "n", "s" }, "<C-q>", "<cmd>q<cr><esc>", { desc = "", remap = true })
map("n", "su", "<cmd>w<cr><esc>", { desc = "", remap = true })
map("n", "sp", "<cmd>wq!<cr><esc>", { desc = "", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

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
map('n', '<leader>la', '<cmd>Lazy<CR>')
map('n', '<leader>lm', '<cmd>Mason<CR>')

-- Lspsaga
map("n", '<leader>lf', '<Cmd>Lspsaga finder<CR>', {desc = "[L]spsaga [F]inder"})                      
map("n", '<leader>lp', '<Cmd>Lspsaga peek_type_definition<CR>', {desc = "[L]spsaga [P]eek definition"})
map("n", '<leader>lg', '<Cmd>Lspsaga goto_definition<CR>', {desc = "[L]spsaga [G]oto definition"})      
map("n", '<leader>lh', '<Cmd>Lspsaga hover_doc<CR>', {desc = "[L]spsaga [H]over Documentation"})
map("n", '<leader>lr', '<Cmd>Lspsaga rename<CR>', {desc = "[L]spsaga [R]ename"})
map("n", '<leader>lo', '<Cmd>Lspsaga outline<CR>', {desc = "[L]spsaga [O]utline"})
map("n", '<C-n>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', {desc = "[L]spsaga Jump [N]ext"})
map("n", '<C-p>', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', {desc = "[L]spsaga Jump [P]revious"})

map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
  { noremap = true, silent = true, desc = "[L]spsaga Signature Help" })
map({ "n", "v" }, "<leader>lc", "<cmd>Lspsaga code_action<CR>",
  { noremap = true, silent = true, desc = "[L]spsaga [C]ode Action" })

map('n', '<leader>zi', '<cmd>:lua vim.g.neovide_scale_factor=vim.g.neovide_scale_factor + 0.1<CR>', {silent = true})
map('n', '<leader>zo', '<cmd>:lua vim.g.neovide_scale_factor=vim.g.neovide_scale_factor - 0.1<CR>', {silent = true})
