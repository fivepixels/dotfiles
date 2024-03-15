local lint = require("lint")

lint.events = { "BufWritePost", "BufReadPost", "InsertLeave" }
lint.linters_by_ft = {
  markdown = { "markdownlint" },
}

-- lint.setup.events({
--   events = ,
--   linters_by_ft = {
--     fish = { "fish" },
--   },
--   linters = {},
-- })

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})
