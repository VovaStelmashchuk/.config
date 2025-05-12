vim.g.mapleader = " "

local function remap(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		if opts.desc then
			opts.desc = "keymaps.lua: " .. opts.desc
		end
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local keymap = vim.keymap
local keymapOptionsWithDesc = function(desc)
	return { noremap = true, silent = true, desc = desc }
end

-- Paste from yank register (register 0) with Shift+P
keymap.set("n", "P", '"0p', keymapOptionsWithDesc("Paste from yank register"))
-- En mode visuel aussi
keymap.set("v", "P", '"0p', keymapOptionsWithDesc("Paste from yank register"))

-- Window Management
keymap.set("n", "sh", ":split<CR>", keymapOptionsWithDesc("Split window horizontally"))
keymap.set("n", "sv", ":vsplit<CR>", keymapOptionsWithDesc("Split window vertically"))
keymap.set("n", "sx", "<cmd>close<CR>", keymapOptionsWithDesc("Close current split"))
keymap.set("n", "sw", "<cmd>only<CR>", keymapOptionsWithDesc("Close all other splits"))

-- LSP keymaps
keymap.set("n", "gd", vim.lsp.buf.definition, keymapOptionsWithDesc("Go to definition"))
keymap.set("n", "gi", vim.lsp.buf.implementation, keymapOptionsWithDesc("Go to implementation"))
keymap.set("n", "gr", vim.lsp.buf.references, keymapOptionsWithDesc("Go to references"))
keymap.set("n", "K", vim.lsp.buf.hover, keymapOptionsWithDesc("Show hover information"))
keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, keymapOptionsWithDesc("Code actions"))
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, keymapOptionsWithDesc("Rename symbol"))

-- Diagnostic keymaps
keymap.set("n", "<leader>d", vim.diagnostic.open_float, keymapOptionsWithDesc("Show diagnostics"))
keymap.set("n", "[d", vim.diagnostic.goto_prev, keymapOptionsWithDesc("Previous diagnostic"))
keymap.set("n", "]d", vim.diagnostic.goto_next, keymapOptionsWithDesc("Next diagnostic"))

-- Search
keymap.set("n", "<leader>nh", ":nohlsearch<CR>", keymapOptionsWithDesc("Clear search highlights"))
