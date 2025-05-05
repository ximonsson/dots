-- share settings with Vim
vim.cmd([[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath=&runtimepath
	source ~/.vimrc
]])

vim.cmd("colorscheme kanagawa-dragon")

-------------------------------
-- LSP

vim.lsp.set_log_level("off")

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
