return {
  {
    'romgrk/barbar.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local barbar = require('barbar')
      barbar.setup({
        insert_at_end = true,
        insert_at_start = false,
        semantic_letters = true,
      })
      vim.keymap.set('n', '<space>tn', ':BufferNext<CR>')
      vim.keymap.set('n', '<space>tp', ':BufferPrevious<CR>')
      vim.keymap.set('n', '<space>tg', ':BufferPick<CR>')
      vim.keymap.set('n', '<space>tc', ':BufferClose<CR>')
      vim.keymap.set('n', '<space>co', ':BufferCloseAllButCurrent<CR>')
    end
  }
}
