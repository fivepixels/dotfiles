-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "sh", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "sj", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "sk", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "sl", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<S-n>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<S-p>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<S-n>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-p>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
	"n",
	"<leader>ur",
	"<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
	{ desc = "Redraw / clear hlsearch / diff update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Save and Quit files
map("n", "su", "<cmd>:w<cr><esc>", { desc = "Save the current file" })
map("n", "so", "<cmd>:source %<cr><esc>", { desc = "Configure the current file" })
map("n", "sp", "<cmd>:wq!<cr><esc>", { desc = "Save and Quit from the current file" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Lazy
map("n", "<leader>ll", "<cmd>Lazy<cr>", { desc = "Lazy" })

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
map("n", "<leader>den", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
map("n", "<leader>dep", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
map("n", "<leader>dwn", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
map("n", "<leader>dwp", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- Stylua: ignore start

-- lazygit
map("n", "<leader>gg", function()
	Util.terminal({ "lazygit" }, { cwd = Util.root(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (root dir)" })
map("n", "<leader>gG", function()
	Util.terminal({ "lazygit" }, { esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazygit (cwd)" })

-- Quit
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })

-- Highlights under cursor
map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })

-- floating terminal
map("n", "<leader>ft", function()
	Util.terminal()
end, { desc = "Terminal (cwd)" })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- Windows
map("n", "sp", "<cmd>:q!<cr>", { desc = "Delete window", remap = true })
map("n", "sv", "<C-W>v", { desc = "Split window right", remap = true })
map("n", "ss", "<C-W>s", { desc = "Split window below", remap = true })

-- Tabs
map("n", "tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "tx", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<Tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<S-Tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
