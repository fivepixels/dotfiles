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
map("n", "sJ", "<cmd>split<cr>", { desc = "window: go to the lower window" })
map("n", "sL", "<cmd>vsplit<cr>", { desc = "window: go to the lower window" })
map("n", "s=", "<C-w>=", { desc = "window: equalize all windows" })

-- documents
map("n", "su", "<cmd>w!<cr>", { desc = "document: save the current file" })
map("n", "sp", "<cmd>q!<cr>", { desc = "document: quit from the current file" })
map("n", "sP", "<cmd>qa!<cr>", { desc = "document: quit from the all files" })
map("n", "so", "<cmd>source %<cr>", { desc = "document: source current file" })

map("n", "<C-a>", "gg<S-v>G", { desc = "document: select all lines" })

map("n", "y", '"+y', { desc = "document: better copy" })
map("v", "y", '"+y', { desc = "document: better copy" })
map("n", "Y", '"+Y', { desc = "document: better copy" })
map("x", "p", '"_dP', { desc = "document: better paste" })

map("v", "<C-j>", ":m '>+1<cr>gv=gv", { desc = "document: move the selected lines down" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { desc = "document: move the selected lines down" })

map("n", "<C-j>", "<cmd>+8<cr>", { desc = "document: go down for five lines" })
map("n", "<C-k>", "<cmd>-8<cr>", { desc = "document: go down for five lines" })

map("v", "<", "<gv", { desc = "document: insert a new indent front" })
map("v", ">", ">gv", { desc = "document: remove an indent from front" })

-- managers
map("n", "<leader>ml", "<cmd>Lazy<cr>", { desc = "managers: open a window for Lazy" })
map("n", "<leader>mm", "<cmd>Mason<cr>", { desc = "managers: open a window for mason" })

-- Neovide
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1 / 1.25)
end)

-- Link Opener
local function open_url(isApp, type)
  vim.cmd('normal! "ay')
  local selected_text = vim.fn.getreg("a")
  local where = ""

  if isApp then
    where = "-a " .. type
  end

  if type == "" then
    where = "https://" .. selected_text .. "/"
  end

  if type ~= "" then
    where = "https://" .. type .. ".com/" .. selected_text .. "/"
  end

  vim.cmd("!open " .. where)
end

-- cattynip.dev

-- Link Opener
map("v", "<leader>oo", function()
  open_url(false, "")
end)
map("v", "<leader>og", function()
  open_url(false, "github")
end)
map("v", "<leader>oi", function()
  open_url(false, "instagram")
end)
map("n", "<leader>oo", function()
  open_url(true, "Google\\ Chrome")
end)
map("n", "<leader>og", function()
  open_url(false, "GitHub\\ Desktop")
end)
map("n", "<leader>os", function()
  open_url(true, "Sourcetree")
end)
