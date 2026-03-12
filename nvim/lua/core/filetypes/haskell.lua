-- Haskell language filetype configuration
-- Migrated from ~/.vim/after/ftplugin/haskell.vim

vim.api.nvim_create_autocmd("FileType", {
  pattern = "haskell",
  callback = function()
    -- Use spaces instead of tabs for Haskell
    vim.bo.expandtab = true
  end,
  desc = "Configure Haskell to use spaces for indentation",
})