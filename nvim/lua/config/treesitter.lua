-- Treesitter configuration
-- Migrated from init.lua with enhanced matching features

-- Safe require with error handling
local status, configs = pcall(require, 'nvim-treesitter.configs')
if not status then
  vim.notify("nvim-treesitter.configs not found", vim.log.levels.WARN)
  return
end

configs.setup {
  -- Ensure parsers are installed
  ensure_installed = { 'julia', 'yaml', 'lua', 'python', 'javascript', 'typescript', 'go', 'rust', 'terraform' },
  
  -- Enable syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  
  -- Enable indentation
  indent = {
    enable = true,
  },
  
  -- Enable matching features (replaces matchparen)
  matchup = {
    enable = true,
    include_match_words = true,
    disable_virtual_text = true,
    -- Enable rainbow-like coloring through matchup
    enable_rainbow = true,  -- This provides the color differentiation
  },
}

-- Install any missing parsers (safe to call even if already configured)
local install_status, install = pcall(require, 'nvim-treesitter.install')
if install_status then
  install.prefer_git = true
  install.compilers = { "gcc" }
end