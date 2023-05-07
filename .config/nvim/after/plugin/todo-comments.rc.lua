local status, todo = pcall(require, "todo-comments")
if (not status) then return end

-- https://github.com/folke/todo-comments.nvim

-- FIX: asdf
-- FIXME: asdf
-- BUG: asdf
-- FIXIT: asdf
-- ISSUE: asdf

-- TODO: asdf
-- HACK: asdf

-- WARN: asdf
-- WARNING: asdf
-- XXX: asdf

-- PERF: asdf
-- OPTIM: asdf
-- PERFORMANCE: asdf
-- OPTIMIZE: asdf

-- NOTE: asdf
-- INFO: asdf

-- TEST: asdf
-- TESTING: asdf
-- PASSED: asdf
-- FAILED asdf

todo.setup {
}

local keymap = vim.keymap;

keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end)

keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end)
