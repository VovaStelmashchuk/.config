return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = "VeryLazy",
    keys = {
      { "<leader>ff", ":Telescope find_files<cr>" },
      { "<leader>fg", ":Telescope live_grep<cr>" },
      { "<leader>fb", ":Telescope buffers<cr>" },
    }
  }
}
