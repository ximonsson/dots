-- Syntax highlighting tweaks
-- Migrated from ~/.vim/after/syntax/
-- Note: These may not be needed with modern treesitter, but preserved for compatibility

local autocmd = vim.api.nvim_create_autocmd

-- Go syntax highlighting tweaks
autocmd("Syntax", {
  pattern = "go",
  callback = function()
    vim.cmd("hi link goSpecialChar SpecialChar")
    vim.cmd("hi link goBoolean Special")
  end,
})

-- JSX syntax highlighting tweaks
autocmd("Syntax", {
  pattern = "jsx",
  callback = function()
    vim.cmd("hi xmlAttrib ctermfg=7")
    vim.cmd("hi xmlTag ctermfg=14")
  end,
})

-- Julia syntax highlighting tweaks
autocmd("Syntax", {
  pattern = "julia",
  callback = function()
    -- Add any Julia-specific syntax highlights here if needed
  end,
})

-- Other syntax patterns can be added as needed
-- Most modern syntax highlighting is handled by treesitter now