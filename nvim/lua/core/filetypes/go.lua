-- Go language filetype configuration
-- Migrated from ~/.vim/after/ftplugin/go.vim

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- Use goimports for formatting (better than gofmt)
    vim.g.go_fmt_command = "goimports"
  end,
  desc = "Configure Go formatting to use goimports",
})