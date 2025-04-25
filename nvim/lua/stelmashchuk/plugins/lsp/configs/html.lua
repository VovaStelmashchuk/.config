local M = {}

function M.setup(capabilities)
	require("lspconfig").html.setup({
		capabilities = capabilities,
		filetypes = { "html", "vue" },
		init_options = {
			configurationSection = { "html", "css", "javascript" },
			embeddedLanguages = {
				css = true,
				javascript = true,
			},
		},
		settings = {
			html = {
				format = {
					indentInnerHtml = true,
					wrapLineLength = 120,
					wrapAttributes = "auto",
					templating = true,
					unformatted = nil,
				},
				hover = {
					documentation = true,
					references = true,
				},
				completion = {
					attributeDefaultValue = "doublequotes",
				},
				validate = {
					scripts = true,
					styles = true,
				},
			},
		},
	})

	-- Configuration des snippets et emmet si nécessaire
	vim.g.user_emmet_leader_key = "<C-e>"
	vim.g.user_emmet_settings = {
		html = {
			snippets = {
				["!"] = "!!!+html[lang=${lang}]>(head>(meta[charset=${charset}]+title{${1:Document}})+body",
			},
		},
	}
end

return M
