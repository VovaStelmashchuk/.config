return {
  {
    "neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.g.coc_global_extensions = {
        "coc-json",
        "coc-tsserver",
        "coc-vetur",
        "coc-html",
        "coc-css",
        "coc-eslint",
        "coc-prettier",
        "@yaegassy/coc-volar",
      }

      -- Keybindings
      local keymap = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }

      keymap("n", "gd", "<Plug>(coc-definition)", opts)
      keymap("n", "gr", "<Plug>(coc-references)", opts)

      -- show documentation
      keymap("n", "K", ":call CocActionAsync('doHover')<CR>", opts)

      keymap("n", "<leader>rn", "<Plug>(coc-rename)", opts)
      keymap("n", "<leader>cf", ":CocCommand editor.action.formatDocument<CR>", opts)

      -- Accept completion with Enter
      vim.cmd([[
        inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
      ]])
    end,
  },
}
