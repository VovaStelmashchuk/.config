return {
	{
		"nvim-treesitter/nvim-treesitter",
		optional = true,
		opts = { ensure_installed = { "markdown", "markdown_inline" } },
	},
	-- Markdown preview
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			latex = { enabled = false },
		},
		ft = { "markdown" },
		keys = {},
	},
}
