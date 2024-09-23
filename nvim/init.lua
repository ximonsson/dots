-- share settings with Vim
vim.cmd([[
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath=&runtimepath
	source ~/.vimrc
]])

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

-- setup Ruff
require('lspconfig').ruff_lsp.setup {
	init_options = {
		settings = {
			args = {},
		}
	}
}

