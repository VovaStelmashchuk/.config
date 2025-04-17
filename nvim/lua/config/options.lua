vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

-- Borrow those settings from LazyVim
opt.autowrite = true                                    -- Enable auto write

-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.g.markdown_recommended_style = 0

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.softtabstop = 2
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.scrolloff = 8
opt.number = true

