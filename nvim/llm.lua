local CODESTRAL_API_KEY = vim.fn.system(
	"pass mistral.ai/simonsson.simon@gmail.com | grep CODESTRAL_API_KEY: | awk '{print $2}'"
):gsub("^%s*(.-)%s*$", "%1")

vim.g.CODESTRAL_API_KEY = CODESTRAL_API_KEY

require('minuet').setup{
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
			api_key = function () return CODESTRAL_API_KEY end,
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

require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "codestral",
		},
		inline = {
			adapter = "codestral",
		},
	},
})
