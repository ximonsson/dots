-- Python language filetype configuration

local utils = require("core.filetypes.utils")

-- Standard formatting for Python files using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
  desc = "Format Python files on save using LSP",
})
