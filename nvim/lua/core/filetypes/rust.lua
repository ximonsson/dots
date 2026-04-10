-- Rust language filetype configuration
-- Migrated from ~/.vim/after/ftplugin/rust.vim

local utils = require("core.filetypes.utils")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    -- Enable automatic formatting on save
    vim.g.rustfmt_autosave = 1
  end,
  desc = "Enable automatic rustfmt on save",
})

-- Standard formatting for Rust files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function()
	vim.lsp.buf.format({async = false })
  end,
  desc = "Format Rust files on save",
})
