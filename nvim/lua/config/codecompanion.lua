-- CodeCompanion configuration
-- Migrated from init.lua

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