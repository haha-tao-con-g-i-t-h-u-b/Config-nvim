-- File: lua/config/lazy.lua

-- Bootstrap lazy.nvim nếu chưa cài
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugin list
require("lazy").setup({

  -- 🌈 Giao diện - Theme
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      require("onedark").setup({ style = "darker" })
      require("onedark").load()
    end,
  },

  -- 📂 File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
    end,
  },

  -- 🔍 Tìm kiếm - Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  },

  -- 📊 Treesitter - Highlight code thông minh
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },

  -- 📦 Thanh trạng thái - Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "onedark",
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
      })
    end,
  },
   {
  	'lervag/vimtex',
  	lazy = false,
  	config = function()
    	vim.g.vimtex_view_method = 'sumatrapdf' -- nếu mày dùng Windows
    	vim.g.vimtex_compiler_method = 'latexmk'
  	end
   }

  -- 🚀 Giao diện mở đầu - Dashboard
}) -- Kết thúc lazy.setup()
