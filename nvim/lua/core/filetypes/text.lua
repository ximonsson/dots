-- Text filetype configuration
-- Migrated from ~/.vim/after/ftplugin/text.vim

vim.api.nvim_create_autocmd("FileType", {
  pattern = "text",
  callback = function()
    -- Enable word wrapping for text files
    vim.wo.wrap = true
    vim.wo.linebreak = true
    
    -- Map j/k to gj/gk for better navigation in wrapped text
    local function map(lhs, rhs)
      vim.keymap.set("n", lhs, rhs, { buffer = true, noremap = true })
    end
    
    map("j", "gj")  -- Move down by screen line
    map("k", "gk")  -- Move up by screen line
  end,
  desc = "Configure text file wrapping and navigation",
})