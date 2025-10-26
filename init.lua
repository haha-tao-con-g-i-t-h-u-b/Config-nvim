require("config.lazy")

-- Các option đơn giản
vim.opt.number = true
vim.opt.wrap = false
vim.cmd([[
  set nowrap
]])

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
