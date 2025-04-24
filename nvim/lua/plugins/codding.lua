local completion = vim.g.completion_mode or "blink"

return {
  {
    "github/copilot.vim",
    version = "v1.42.0",
    event = "VeryLazy",
    config = function()
      -- For copilot.vim
      -- enable copilot for specific filetypes
      vim.g.copilot_filetypes = {
        ["TelescopePrompt"] = false,
        ["grug-far"] = false,
        ["grug-far-history"] = false,
        ["copilot-chat"] = false,
      }

      -- Set to true to assume that copilot is already mapped
      vim.g.copilot_assume_mapped = true
      -- Set workspace folders
      vim.g.copilot_workspace_folders = "~/Projects"

      -- Setup keymaps
      local keymap = vim.keymap.set
      local opts = { silent = true }

      -- Set <C-y> to accept copilot suggestion
      keymap("i", "<C-y>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

      -- Set <C-i> to accept line
      keymap("i", "<C-i>", "<Plug>(copilot-accept-line)", opts)

      -- Set <C-j> to next suggestion, <C-k> to previous suggestion
      keymap("i", "<C-j>", "<Plug>(copilot-next)", opts)
      keymap("i", "<C-k>", "<Plug>(copilot-previous)", opts)

      -- Set <C-d> to dismiss suggestion
      keymap("i", "<C-d>", "<Plug>(copilot-dismiss)", opts)
    end,
  },
  -- Autocomplete, refer to https://cmp.saghen.dev/#compared-to-built-in-completion for more information
  {
    "saghen/blink.cmp",
    event = "InsertEnter",
    enable = completion == "blink",
    version = "1.1.1",
    dependencies = {
      {
        -- optional: provides snippets for the snippet source
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        build = (function()
          return "make install_jsregexp"
        end)(),
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            config = function()
              require("luasnip.loaders.from_vscode").lazy_load()
              require("luasnip.loaders.from_vscode").lazy_load { paths = { vim.fn.stdpath "config" .. "/snippets" } }
            end,
          },
        },
      },
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            { path = "snacks.nvim",        words = { "Snacks" } },
            { path = "lazy.nvim",          words = { "LazyVim" } },
          },
        },
        optional = true,
      },
      {
        "fang2hou/blink-copilot"
      }
    },
    ---@module 'blink.cmp'
    -- Refer https://cmp.saghen.dev/installation.html
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = "enter" },
      completion = {
        -- Controls whether the documentation window will automatically show when selecting a completion item
        documentation = {
          auto_show = true,
        },
      },
      -- Experimental signature help support
      signature = {
        enabled = false,
      },
      appearance = {
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        nerd_font_variant = "mono",
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "lazydev", "copilot", "markdown" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100, -- show at a higher priority than lsp
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
          },
          markdown = {
            name = "RenderMarkdown",
            module = "render-markdown.integ.blink",
            fallbacks = { "lsp" },
          },
        },
      },
      -- Disable cmdline completions
      cmdline = {
        enabled = false,
      },
      -- Disable per file type
      enabled = function()
        return not vim.tbl_contains({ "copilot-chat" }, vim.bo.filetype)
            and not vim.tbl_contains({ "codecompanion" }, vim.bo.filetype)
            and vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
      end,
    },
    -- without having to redefine it
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat", -- Support nvim-cmp source
      "sources.default",
    },
  },
  {
    "echasnovski/mini.pairs",
    event = "VeryLazy",
    opts = {},
  },
}
