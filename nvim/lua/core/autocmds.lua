-- Autocommands
-- Migrated from vimrc and init.lua

local autocmd = vim.api.nvim_create_autocmd

-- Auto formatting and whitespace trimming on save
-- Merged from vimrc and init.lua for better performance
autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    -- First trim whitespace (migrated from vimrc)
    --vim.cmd("%s/\\s\+$//e")  -- Fixed escape sequence
	vim.cmd([[
		%s/\s\+$//e
	]])  -- Fixed escape sequence
	
    -- Then format with LSP (from init.lua)
    pcall(function()  -- Use pcall to handle cases where LSP isn't available
      vim.lsp.buf.format {
        async = false,
      }
    end)
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
