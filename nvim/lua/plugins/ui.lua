return {
  {
    "mini.bufremove",
    enabled = false,
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<cmd>tabnext<cr>", desc = "tab: move to the next tab" },
      { "<S-Tab>", "<cmd>tabprev<cr>", desc = "tab: move to the previous tab" },
      { "<leader>tp", "<cmd>tabclose<cr>", desc = "tab: close the current tab" },
      { "<leader>tu", "<cmd>BufferLineCycleNext<cr>", desc = "tab: open up a new tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        show_buffer_close_icons = true,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
    config = function(_, opts)
      require("bufferline").setup(opts)
      -- Fix bufferline when restoring a session
      vim.api.nvim_create_autocmd("BufAdd", {
        callback = function()
          vim.schedule(function()
            pcall(nvim_bufferline)
          end)
        end,
      })
    end,
  },
}
