-- Terraform language filetype configuration

local utils = require("core.filetypes.utils")

-- Standard formatting for Terraform files using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
	vim.lsp.buf.format({ async = false })
  end,
  desc = "Format Terraform files on save using LSP",
})
