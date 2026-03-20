-- Lua language filetype configuration

local utils = require("core.filetypes.utils")

-- Configure Lua formatting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    -- Use 2 spaces for indentation
    vim.bo.shiftwidth = 2
    vim.bo.tabstop = 2
    vim.bo.expandtab = true
  end,
  desc = "Configure Lua indentation to use 2 spaces",
})

-- Standard formatting for Lua files using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.lua",
  callback = function()

  end,
  desc = "Format Lua files on save using LSP",
})
