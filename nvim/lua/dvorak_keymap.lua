local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

map("n", "n", "h", { desc = "left" })
map("n", "h", "j", { desc = "down" })
map("n", "t", "k", { desc = "up" })
map("n", "s", "l", { desc = "right" })

map("v", "n", "h", { desc = "left" })
map("v", "h", "j", { desc = "down" })
map("v", "t", "k", { desc = "up" })
map("v", "s", "l", { desc = "right" })

-- Normal mode split navigation
map("n", "<C-w>n", "<C-w>h", { desc = "Move to left split" })
map("n", "<C-w>h", "<C-w>j", { desc = "Move to down split" })
map("n", "<C-w>t", "<C-w>k", { desc = "Move to up split" })
map("n", "<C-w>s", "<C-w>l", { desc = "Move to right split" })

-- Visual mode split navigation
map("v", "<C-w>n", "<C-w>h", { desc = "Move to left split" })
map("v", "<C-w>h", "<C-w>j", { desc = "Move to down split" })
map("v", "<C-w>t", "<C-w>k", { desc = "Move to up split" })
map("v", "<C-w>s", "<C-w>l", { desc = "Move to right split" })
