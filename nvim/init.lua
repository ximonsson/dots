-- share settings with Vim
vim.cmd([[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath=&runtimepath
	source ~/.vimrc
]])

--vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		vim.lsp.buf.format {
			async = false,
		}
	end,
})


-- setup Ruff
require('lspconfig').ruff_lsp.setup {
	init_options = {
		settings = {
			args = {},
		}
	}
}

