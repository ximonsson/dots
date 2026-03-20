-- Neovim configuration
-- Main entry point - keeps things minimal and organized

-- Set up runtime path for Lua modules
vim.opt.runtimepath:prepend(vim.fn.stdpath("config") .. "/lua")

-- Load core settings first
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Load filetype-specific configurations
require("core.filetypes.go")
require("core.filetypes.julia")
require("core.filetypes.rust")
require("core.filetypes.haskell")
require("core.filetypes.markdown")
require("core.filetypes.text")
require("core.filetypes.python")
require("core.filetypes.terraform")
require("core.filetypes.lua")
require("core.filetypes.typescript")

-- Load syntax highlighting tweaks
require("core.syntax")

-- Set up plugin manager and plugins
require("plugins")

-- Load plugin configurations after plugins are loaded
require("config.lsp")
require("config.minuet")
require("config.codecompanion")
require("config.render-markdown")
require("config.lualine")
require("config.treesitter")

-- Set colorscheme (after plugins are loaded)
vim.cmd("colorscheme retrobox")
