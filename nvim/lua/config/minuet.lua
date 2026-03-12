-- Minuet AI configuration
-- Migrated from init.lua

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
      end_point = "http://localhost:4000/mistral/v1/fim/completions",
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
  provider = "codestral",
}