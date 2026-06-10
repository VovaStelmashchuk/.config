return {
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    keys = {
      { "<leader>uv", "<cmd>ASToggle<cr>", desc = "Toggle Auto Save" },
    },
    opts = {
      -- delay after which a pending save is executed (default 1000)
      debounce_delay = 1000,
    },
  },
}
