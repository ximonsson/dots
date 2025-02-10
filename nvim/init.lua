-- share settings with Vim
vim.cmd([[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath=&runtimepath
	source ~/.vimrc
]])

-------------------------------
-- LSP

--- Formatting
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		vim.lsp.buf.format {
			async = false,
		}
	end,
})
--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

lspconf = require'lspconfig'

-- python

-- ruff
lspconf.ruff.setup {
	init_options = {
		settings = {
			args = {},
		}
	}
}

-- terraform
lspconf.terraformls.setup{}

-- typescript
lspconf.ts_ls.setup{}

-- svelte
lspconf.svelte.setup{}
