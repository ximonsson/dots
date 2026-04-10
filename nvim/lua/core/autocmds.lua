-- Autocommands
-- Migrated from vimrc and init.lua

local autocmd = vim.api.nvim_create_autocmd

-- Fallback formatting for filetypes without specific configuration
-- This runs only if no filetype-specific BufWritePre autocmd exists
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
	-- always trim whitespace
    vim.cmd([[
      %s/\s\+$//e
    ]])
  end,
})

-- Filetype specific settings (from vimrc)
autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.gp",
  callback = function()
    vim.bo.filetype = "gnuplot"
  end,
})

autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.neomuttrc",
  callback = function()
    vim.bo.filetype = "neomuttrc"
  end,
})
