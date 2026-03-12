-- Julia language filetype configuration
-- Migrated from ~/.vim/after/ftplugin/julia.vim

vim.api.nvim_create_autocmd("FileType", {
  pattern = "julia",
  callback = function()
    -- Disable bracket alignment for Julia
    vim.g.julia_indent_align_brackets = 0
    
    -- Use tabs instead of spaces for Julia
    vim.bo.expandtab = false
  end,
  desc = "Configure Julia indentation and formatting",
})