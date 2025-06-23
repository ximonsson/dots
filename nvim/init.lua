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
-- LLM
--
-- I don't enable suggestions as I type because I find it super
-- annoying and there are so many errors. Below I map C-k to complete.

require('llm').setup({
	api_token = "xxx", -- cf Install paragraph
	model = "code-clerk", -- the model ID, behavior depends on backend
	backend = "openai", -- backend ID, "huggingface" | "ollama" | "openai" | "tgi"
	url = "http://127.0.0.1:5000/v1/completions", -- the http url of the backend
	tokens_to_clear = { "<|endoftext|>" }, -- tokens to remove from the model's output

	-- parameters that are added to the request body, values are arbitrary,
	-- you can set any field:value pair here it will be passed as is to the backend
	request_body = {
		top_p = 1,
		temperature = 0.0,
		stop = {"\n\n"},
	},

	-- set this if the model supports fill in the middle
	fim = {
		enabled = true,
		--prefix = "<fim_prefix>",
		--middle = "<fim_middle>",
		--suffix = "<fim_suffix>",
	},

	debounce_ms = 150,
	accept_keymap = "<Tab>",
	dismiss_keymap = "<S-Tab>",
	tls_skip_verify_insecure = true,

	-- llm-ls configuration, cf llm-ls section
	lsp = {
		bin_path = nil,
		host = nil,
		port = nil,
		cmd_env = nil, -- or { LLM_LOG_LEVEL = "DEBUG" } to set the log level of llm-ls
		version = "0.5.3",
	},

	tokenizer = nil, -- cf Tokenizer paragraph
	context_window = 256000, -- max number of tokens for the context window
	enable_suggestions_on_startup = false,
	enable_suggestions_on_files = "*", -- pattern matching syntax to enable suggestions on specific files, either a string or a list of strings
	disable_url_path_completion = false, -- cf Backend
})

vim.keymap.set("i", "<C-k>", "<Esc>:LLMSuggestion<CR>a", { silent = true, noremap = true })
