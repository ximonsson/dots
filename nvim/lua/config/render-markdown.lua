-- Render Markdown configuration
-- Migrated from init.lua

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
  file_types = { "markdown", "codecompanion" },
})