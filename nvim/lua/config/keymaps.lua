local function remap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    if opts.desc then
      opts.desc = "keymaps.lua: " .. opts.desc
    end
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

remap("n", "n", "h", { desc = "left" })
remap("n", "h", "j", { desc = "down" })
remap("n", "t", "k", { desc = "up" })
remap("n", "s", "l", { desc = "right" })

remap("v", "n", "h", { desc = "left" })
remap("v", "h", "j", { desc = "down" })
remap("v", "t", "k", { desc = "up" })
remap("v", "s", "l", { desc = "right" })

-- Normal mode split navigation
remap("n", "<C-w>n", "<C-w>h", { desc = "Move to left split" })
remap("n", "<C-w>h", "<C-w>j", { desc = "Move to down split" })
remap("n", "<C-w>t", "<C-w>k", { desc = "Move to up split" })
remap("n", "<C-w>s", "<C-w>l", { desc = "Move to right split" })

-- Visual mode split navigation
remap("v", "<C-w>n", "<C-w>h", { desc = "Move to left split" })
remap("v", "<C-w>h", "<C-w>j", { desc = "Move to down split" })
remap("v", "<C-w>t", "<C-w>k", { desc = "Move to up split" })
remap("v", "<C-w>s", "<C-w>l", { desc = "Move to right split" })

