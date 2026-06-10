return {
  {
    "mason-org/mason.nvim",
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- diagnostics
      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "\u{f057} ", -- nf-fa-times_circle
            [vim.diagnostic.severity.WARN] = "\u{f071} ", -- nf-fa-warning
            [vim.diagnostic.severity.HINT] = "\u{f0eb} ", -- nf-fa-lightbulb_o
            [vim.diagnostic.severity.INFO] = "\u{f05a} ", -- nf-fa-info_circle
          },
        },
      })

      -- default config for all servers
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities({
          workspace = {
            fileOperations = {
              didRename = true,
              willRename = true,
            },
          },
        }),
      })

      -- per-server settings
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            codeLens = {
              enable = true,
            },
            completion = {
              callSnippet = "Replace",
            },
            doc = {
              privateName = { "^_" },
            },
            hint = {
              enable = true,
              setType = false,
              paramType = true,
              paramName = "Disable",
              semicolon = "Disable",
              arrayIndex = "Disable",
            },
          },
        },
      })

      -- install servers with mason and enable them automatically
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls" },
        -- stylua is a formatter (run by conform), don't start it as an LSP server
        automatic_enable = { exclude = { "stylua" } },
      })

      -- keymaps and per-buffer features
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
        callback = function(event)
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client then
            return
          end
          local buf = event.buf

          local function map(lhs, rhs, desc, mode)
            vim.keymap.set(mode or "n", lhs, rhs, { buffer = buf, desc = desc })
          end

          -- stylua: ignore start
          map("<leader>cl", function() Snacks.picker.lsp_config() end, "Lsp Info")
          map("gd", vim.lsp.buf.definition, "Goto Definition")
          map("gr", vim.lsp.buf.references, "References")
          map("gI", vim.lsp.buf.implementation, "Goto Implementation")
          map("gy", vim.lsp.buf.type_definition, "Goto T[y]pe Definition")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("K", function() return vim.lsp.buf.hover() end, "Hover")
          map("gK", function() return vim.lsp.buf.signature_help() end, "Signature Help")
          map("<c-k>", function() return vim.lsp.buf.signature_help() end, "Signature Help", "i")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "x" })
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>cR", function() Snacks.rename.rename_file() end, "Rename File")
          map("<leader>cc", vim.lsp.codelens.run, "Run Codelens", { "n", "x" })
          map("<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
          map("<leader>co", function()
            vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" }, diagnostics = {} }, apply = true })
          end, "Organize Imports")
          -- stylua: ignore end

          -- inlay hints
          if client:supports_method("textDocument/inlayHint", buf) then
            if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == "" then
              vim.lsp.inlay_hint.enable(true, { bufnr = buf })
            end
          end
        end,
      })
    end,
  },
}
