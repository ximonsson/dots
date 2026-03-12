-- Core Neovim options and settings
-- Migrated from vimrc with Neovim-specific improvements

local options = {
  -- Basic editor settings
  number = true,                  -- Show line numbers
  cursorline = true,              -- Highlight current line
  hlsearch = true,                -- Highlight search results
  
  -- Indentation settings
  autoindent = true,              -- Auto-indent new lines
  tabstop = 4,                    -- Number of spaces a tab counts for
  shiftwidth = 4,                 -- Number of spaces for autoindent
  softtabstop = 4,                -- Number of spaces tab counts for while editing
  expandtab = false,              -- Use spaces instead of tabs (changed from vimrc)
  
  -- Encoding and file handling
  encoding = "utf-8",             -- Set encoding to UTF-8
  autoread = true,                -- Automatically reload files changed outside Neovim
  hidden = true,                  -- Allow buffer switching without saving
  
  -- UI/UX improvements
  mouse = "",                     -- Disable mouse (from vimrc)
  
  -- Performance
  lazyredraw = true,              -- Don't redraw while executing macros
  
  -- Filetype and plugin settings
  -- Note: filetype.plugin and filetype.indent are set separately below
  
  -- Ignore files
  wildignore = "*.o,*.a,*.so,*.pyc" -- Files to ignore in file navigation
  -- Trim whitespace on save (migrated from vimrc autocmd)
  -- This will be handled in autocmds.lua
}

-- Apply all options
for option, value in pairs(options) do
  vim.opt[option] = value
end

-- Set filetype-specific options (these can't be set in the main options table)
vim.cmd([[
filetype plugin indent on
]])

-- Set leader key (space by default, but can be customized)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


