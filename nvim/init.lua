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

------------------------------------

--require("llm.lua")

require('minuet').setup {
	virtualtext = {
		auto_trigger_ft = {},
		keymap = {
			-- accept whole completion
			accept = '<C-m>',
			-- accept one line
			accept_line = '<A-a>',
			-- accept n lines (prompts for number)
			-- e.g. "A-z 2 CR" will accept 2 lines
			accept_n_lines = '<A-z>',
			-- Cycle to prev completion item, or manually invoke completion
			prev = '<C-k>',
			-- Cycle to next completion item, or manually invoke completion
			next = '<A-]>',
			dismiss = '<A-e>',
		},
	},
	provider_options = {
		codestral = {
			model = 'codestral-latest',
			end_point = 'https://codestral.mistral.ai/v1/fim/completions',
			api_key = 'CODESTRAL_API_KEY',
			stream = true,
			--template = {
				--prompt = "See [Prompt Section for default value]",
				--suffix = "See [Prompt Section for default value]",
			--},
			optional = {
				max_tokens = 256,
				stop = { '\n\n' },
			},
		},
	},
	provider = "codestral",
}

require('lualine').setup {
	sections = {
		lualine_x = {
			{
				require 'minuet.lualine',
				-- the follwing is the default configuration
				-- the name displayed in the lualine. Set to "provider", "model" or "both"
				-- display_name = 'both',
				-- separator between provider and model name for option "both"
				-- provider_model_separator = ':',
				-- whether show display_name when no completion requests are active
				-- display_on_idle = false,
			},
			'encoding',
			'fileformat',
			'filetype',
		},
	},
}
