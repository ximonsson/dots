-- Go language filetype configuration
-- Migrated from ~/.vim/after/ftplugin/go.vim

local utils = require("core.filetypes.utils")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- Use goimports for formatting (better than gofmt)
    vim.g.go_fmt_command = "goimports"
  end,
  desc = "Configure Go formatting to use goimports",
})

-- Organize imports on save for Go files
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
	-- Organize imports
	M.organize_imports()
	-- Format using LSP
	vim.lsp.buf.format({ async = false })
  end,
  desc = "Organize imports and format Go files on save",
})
