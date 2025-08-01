-- File: init.lua

require("config.lazy")

-- Các option đơn giản
vim.opt.number = true
vim.opt.relativenumber = false
-- Latex
vim.g.vimtex_compiler_autostart = 1
vim.g.vimtex_quickfix_ignore_filters = {
  "Warning",
}
vim.cmd([[
  augroup LatexCleanUp
    autocmd!
    autocmd User VimtexEventCompileSuccess silent !latexmk -c
  augroup END
]])

