-- share settings with Vim
vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
]])

vim.cmd("colorscheme kanagawa-dragon")

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

--- Formatting
vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		vim.lsp.buf.format {
			async = false,
		}
	end,
})

-- from mistral
vim.diagnostic.config({
	virtual_text = {
		-- This enables inline error messages
		prefix = '●', -- You can customize the prefix
	},
	signs = true, -- Show signs in the sign column
	underline = true, -- Underline errors, warnings, etc.
	update_in_insert = false, -- Update diagnostics in insert mode
})

require('mini.diff').setup()


-------------------------------
-- LSP

vim.lsp.set_log_level("warn")

-- python

-- ruff
vim.lsp.config("ruff", {
	init_options = {
		settings = {
			args = {},
		}
	}
})

-- terraform
vim.lsp.config("terraformls", {})

-- typescript
vim.lsp.config("ts_ls", {})

-- svelte
vim.lsp.config("svelte", {})

-- golang
vim.lsp.config("gopls", {
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                staticcheck = true,
            },
            codelenses = {
                generate = true,
                test = true,
            },
        },
    },
})

vim.lsp.enable({"ruff", "terraformls", "ts_ls", "svelte", "gopls"})


-- autocmd("BufWritePre", {
-- 	pattern = "*.go",
-- 	callback = function()
-- 		local params = vim.lsp.util.make_range_params()
-- 		params.context = {only = {"source.organizeImports"}}
		-- buf_request_sync defaults to a 1000ms timeout. Depending on your
		-- machine and codebase, you may want longer. Add an additional
		-- argument after params if you find that you have to write the file
		-- twice for changes to be saved.
		-- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
-- 		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
-- 		for cid, res in pairs(result or {}) do
-- 			for _, r in pairs(res.result or {}) do
-- 				if r.edit then
-- 					local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
-- 					vim.lsp.util.apply_workspace_edit(r.edit, enc)
-- 				end
-- 			end
-- 		end
		-- vim.lsp.buf.format({async = false})
-- 	end
-- })

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
	file_types = { "markdown", "codecompanion" },
})


------------------------------------
--- LLM stuffz

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
		openai_fim_compatible = {
			model = "codestral-fim-latest",
			end_point = "http://localhost:4000/v1/completions",
			api_key = function () return "xxx" end,
			stream = true,
			name = "Warpgate",
			--template = {
				--prompt = "See [Prompt Section for default value]",
				--suffix = "See [Prompt Section for default value]",
			--},
			optional = {
				max_tokens = 256,
				stop = { '\n\n' },
				top_p = 1,
				temperature = 0,
			},
		},
		codestral = {
			model = 'codestral-latest',
			end_point = 'https://codestral.mistral.ai/v1/fim/completions',
			api_key = function () return "xxx" end,
			stream = true,
			--template = {
				--prompt = "See [Prompt Section for default value]",
				--suffix = "See [Prompt Section for default value]",
			--},
			optional = {
				max_tokens = 256,
				stop = { '\n\n' },
				top_p = 1,
				temperature = 0,
			},
		},
	},
	provider = "openai_fim_compatible",
}

require("codecompanion").setup({
	strategies = {
		chat = {
			adapter = "warpstral"
		},
		inline = {
			adapter = "warpstral"
		},
		cmd = {
			adapter = "warpstral"
		},
	},
	adapters = {
		http = {
			mlflow = function()
				return require("codecompanion.adapters").extend("openai_compatible", {
					name = "code_clerk",
					formatted_name = "Code Clerk",

					env = {
						api_key = "xxx",
						url = "http://localhost:5000",
					},

					opts = {
						vision = false,
					},

					handlers = {
						---@param self CodeCompanion.Adapter
						---@return boolean
						setup = function(self)
							if self.opts and self.opts.stream then
								self.parameters.stream = true
							end
							return true
						end
					}
				})
			end,

			warpstral = function()
				return require("codecompanion.adapters").extend("mistral", {
					name = "warpstral",
					formatted_name = "Warpstral",

					env = {
						url = "http://localhost:4000/mistral",
						api_key = "xxx",
					},

					schema = {
						---@type CodeCompanion.Schema
						model = {
							default = "devstral-small-latest",
						}
					}
				})
			end,
		},
	}
})
