return {
	{
		"echasnovski/mini.icons",
		opts = {
			file = {},
			filetype = {
				dotenv = { glyph = "", hl = "MiniIconsYellow" },
			},
		},
		config = function(_, options)
			local icons = require("mini.icons")
			icons.setup(options)
			-- Mocking methods of 'nvim-tree/nvim-web-devicons' for better integrations with plugins outside 'mini.nvim'
			icons.mock_nvim_web_devicons()
		end,
	},
}
