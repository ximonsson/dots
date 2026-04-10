-- TypeScript language filetype configuration

local utils = require("core.filetypes.utils")

-- Standard formatting for TypeScript files using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.ts", "*.tsx", "*.js", "*.jsx"},
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
  desc = "Format TypeScript/JavaScript files on save using LSP",
})
