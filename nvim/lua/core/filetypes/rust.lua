-- Rust language filetype configuration
-- Migrated from ~/.vim/after/ftplugin/rust.vim

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    -- Enable automatic formatting on save
    vim.g.rustfmt_autosave = 1
  end,
  desc = "Enable automatic rustfmt on save",
})