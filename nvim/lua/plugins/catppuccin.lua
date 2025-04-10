return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        color_overrides = {
          mocha = {
            base = "#1d1f21", -- Darker background
            mantle = "#282a36", -- Mantle with higher contrast
            crust = "#44475a", -- Crust for even higher contrast
            text = "#f8f8f2",  -- Bright text for better readability
            surface0 = "#6272a4", -- For a balanced contrast of inactive text
            overlay0 = "#ff79c6", -- High contrast overlay (e.g., cursorline)
          },
        },
        highlight_overrides = {
          mocha = function(colors)
            return {
              Comment = { fg = "#ffb86c", italic = true }, -- Bright comments
              Function = { fg = "#8be9fd", bold = true }, -- Highlight functions
              Keyword = { fg = "#ff5555", bold = true }, -- Bold keywords
              Type = { fg = "#bd93f9", bold = true }, -- Type definitions more visible
            }
          end,
        },
      })
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
