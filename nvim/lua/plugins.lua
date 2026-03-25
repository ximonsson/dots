-- Plugin management using lazy.nvim
-- https://github.com/folke/lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Configure and load plugins
require("lazy").setup({
  -- Colorscheme
  {
    "rebelot/kanagawa.nvim",
    lazy = false,    -- Load immediately
    priority = 1000, -- Load before other plugins
    config = function()
      -- Colorscheme will be set in init.lua after plugins load
    end,
  },

  -- Lualine (status line)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("config.lualine")
    end,
  },

  -- LSP and related
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },

  -- Treesitter (better syntax highlighting and matching)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",      -- Auto-close tags
      "andymass/vim-matchup",       -- Enhanced matching
    },
    config = function()
      require("config.treesitter")
    end,
  },

  -- Mini.diff (from your config)
  {
    "echasnovski/mini.diff",
    version = false,
    config = function()
      require('mini.diff').setup()
    end,
  },

  -- Minuet AI (from your config)
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("config.minuet")
    end,
  },

  -- CodeCompanion (from your config)
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("config.codecompanion")
    end,
  },

  -- Render Markdown (from your config)
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("config.render-markdown")
    end,
  },

  -- Plenary (common dependency)
  {
    "nvim-lua/plenary.nvim",
    lazy = true,
  },

  -- Additional useful plugins (can be removed if not wanted)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  {
    "MunifTanjim/nui.nvim",
    lazy = true,
  },

  -- vim-fugitive for Git integration
  {
    "tpope/vim-fugitive",
    lazy = false,  -- Load immediately for Git commands
  },

  -- komau color scheme
  {
    "ntk148v/komau.vim",
    lazy = false,
  },
}, {
  install = {
    --colorscheme = { "kanagawa-dragon" },
    colorscheme = { "komau" },
  },

  -- Performance settings
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        --"netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
