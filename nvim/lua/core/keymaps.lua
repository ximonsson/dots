-- Core keymappings
-- Only includes minimal mappings, keeping existing functionality

-- Note: Most functionality comes from plugins, so this file is minimal
-- to maintain the same behavior as before.

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Basic file operations (same as before, but using leader)
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })