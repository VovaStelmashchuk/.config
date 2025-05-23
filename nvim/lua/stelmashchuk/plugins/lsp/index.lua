return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"pmizio/typescript-tools.nvim",
			"nvim-lua/plenary.nvim",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			local common = require("stelmashchuk.plugins.lsp.configs.common")
			local capabilities = common.setup()

			require("stelmashchuk.plugins.lsp.configs.css").setup(capabilities)
			require("stelmashchuk.plugins.lsp.configs.html").setup(capabilities)
			require("stelmashchuk.plugins.lsp.configs.python").setup(capabilities)
			require("stelmashchuk.plugins.lsp.configs.tailwind").setup(capabilities)
			require("stelmashchuk.plugins.lsp.configs.typescript").setup(capabilities)
			require("stelmashchuk.plugins.lsp.configs.vue").setup(capabilities)
		end,
	},
}
