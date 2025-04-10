return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {

          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = false,
            never_show = {},
            hide_by_name = {
            }
          }
        },
        use_default_mappings = false,
        window = {
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["o"] = "open",
            ["<cr>"] = "open",
            ["a"] = {
              "add",
              config = {
                show_path = "relative"
              }
            },
            ["d"] = "delete",
            ["r"] = "rename",
            ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
          }
        },
      })

      vim.keymap.set("n", "<space>e", ":Neotree left<CR>")
    end,
  },
}
