return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- show hidden files like .env
          ignored = true, -- also show gitignored files
          win = {
            list = {
              keys = {
                ["o"] = "confirm", -- open file / toggle dir in normal mode
              },
            },
          },
        },
      },
    },
  },
}
