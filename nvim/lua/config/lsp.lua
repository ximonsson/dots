-- LSP configuration
-- Migrated from init.lua

-- Set LSP log level
vim.lsp.log.set_level("warn")

-- Diagnostic configuration (from Mistral setup)
vim.diagnostic.config({
  virtual_text = {
    -- This enables inline error messages
    prefix = '●', -- You can customize the prefix
  },
  signs = true, -- Show signs in the sign column
  underline = true, -- Underline errors, warnings, etc.
  update_in_insert = false, -- Update diagnostics in insert mode
})

-- LSP server configurations
local lsp_configs = {
  -- Python - Ruff
  ruff = {
    init_options = {
      settings = {
        args = {},
      }
    }
  },

  -- Terraform
  terraformls = {},

  -- TypeScript
  ts_ls = {},

  -- Svelte
  svelte = {},

  -- Go
  gopls = {
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
      staticcheck = true,
      gofumpt = true,
        codelenses = {
          generate = true,
          test = true,
        },
      },
    },
  },
}

-- Setup each LSP server
for server, config in pairs(lsp_configs) do
  vim.lsp.config(server, config)
end

-- Enable all configured LSP servers
vim.lsp.enable({"ruff", "terraformls", "ts_ls", "svelte", "gopls"})

-- Key mappings for LSP (basic ones)
local function buf_map(bufnr, mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
end

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    local bufnr = args.buf

    -- Basic LSP keymaps
    buf_map(bufnr, 'n', 'gd', vim.lsp.buf.definition, 'Go to definition')
    buf_map(bufnr, 'n', 'gr', vim.lsp.buf.references, 'Go to references')
    buf_map(bufnr, 'n', 'K', vim.lsp.buf.hover, 'Hover documentation')
    buf_map(bufnr, 'n', '<leader>rn', vim.lsp.buf.rename, 'Rename symbol')
    buf_map(bufnr, 'n', '<leader>ca', vim.lsp.buf.code_action, 'Code action')
  end
})
