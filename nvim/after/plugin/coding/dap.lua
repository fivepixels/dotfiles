local dap = require("dap")
local dapui = require("dapui")
local virtual = require("nvim-dap-virtual-text")
local dap_mason = require("mason-nvim-dap")

dapui.setup({})
virtual.setup({})
dap_mason.setup({
  automatic_installation = true,
  ensure_installed = { "python", "node2", "chrome", "firefox", "js", "codelldb", "bash", "dart" }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
end

local map = vim.keymap.set

map("n", "<leader>du", function()
  dapui.toggle({})
end)

map("n", "<leader>de", function()
  dapui.eval({})
end)

map("n", "<leader>dB", function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

map("n", "<leader>db", function()
  dap.toggle_breakpoint()
end)

map("n", "<leader>dc", function()
  dap.continue()
end)

map("n", "<leader>da", function()
  require("dap").continue({ before = get_args })
end)

map("n", "<leader>dC", function()
  dap.run_to_cursor()
end)

map("n", "<leader>dg", function()
  dap.goto_()
end)

map("n", "<leader>di", function()
  dap.step_into()
end)

map("n", "<leader>dj", function()
  dap.down()
end)

map("n", "<leader>dk", function()
  dap.up()
end)

map("n", "<leader>dl", function()
  dap.run_last()
end)

map("n", "<leader>do", function()
  dap.step_out()
end)

map("n", "<leader>dO", function()
  dap.step_over()
end)

map("n", "<leader>dp", function()
  dap.pause()
end)

map("n", "<leader>dr", function()
  dap.repl.toggle()
end)

map("n", "<leader>ds", function()
  dap.session()
end)

map("n", "<leader>dt", function()
  require("dap.ui.widgets").hover()
end)
