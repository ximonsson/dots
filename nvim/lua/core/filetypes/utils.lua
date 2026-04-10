-- Utility functions for filetype-specific operations
-- Migrated from autocmds.lua

local M = {}

--- Organize imports using LSP code action
-- This function should be used in filetype-specific autocmds
-- where organizeImports is supported by the language server
function M.organize_imports()
  local params = vim.lsp.util.make_range_params()
  params.context = {
    only = { "source.organizeImports" },
    diagnostics = vim.diagnostic.get(),
  }

  -- buf_request_sync defaults to a 1000ms timeout. Depending on your
  -- machine and codebase, you may want longer. Add an additional
  -- argument after params if you find that you have to write the file
  -- twice for changes to be saved.
  -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

return M
