-- NOTE: npm install -g @vue/language-server
local Lsp = require "utils.lsp"

return {
  cmd = { "vue-language-server", "--stdio" },
  on_attach = function(client, buffer)
    -- Disable Volar formatting if using external formatter
    client.server_capabilities.documentFormattingProvider = false
    Lsp.on_attach(client, buffer)
  end,
  filetypes = { "vue", "typescript", "javascript", "javascriptreact", "typescriptreact" },
  root_markers = { "package.json", "vite.config.js", "vue.config.js", ".git" },
  init_options = {
    typescript = {
      -- Let Volar locate TypeScript automatically; override if needed
      tsdk = "",
    },
    vue = {
      hybridMode = false,                  -- run embedded TS server for script blocks
      templateInterpolationService = true, -- provide definitions inside <template>
    },
  },
  settings = {
    volar = {
      -- ensure go-to-definition works in template
      takeOverMode = {
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      },
    },
  },
}
