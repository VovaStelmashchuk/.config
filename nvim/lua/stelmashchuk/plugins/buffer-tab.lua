return {
  {
    'romgrk/barbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "VeryLazy",
    keys = {
      { "<leader>tc", ":BufferClose<CR>",             desc = "Delete Other Buffers" },
      { "<leader>tn", ":BufferNext<cr>",              desc = "Next Buffer" },
      { "<leader>tp", ":BufferPrevious<cr>",          desc = "Previues Buffer" },
      { "<leader>tg", ":BufferPick<cr>",              desc = "Show a unique char near tab" },
      { "<leader>co", ":BufferCloseAllButCurrent<cr>" }
    },
    opts = {
      insert_at_end = true,
      insert_at_start = false,
      semantic_letters = true,
    },
  }
}
