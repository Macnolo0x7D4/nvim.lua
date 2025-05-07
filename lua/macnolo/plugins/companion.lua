return {
  "olimorris/codecompanion.nvim",
  opts = {},
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
    },
    opts = {
      log_level = "DEBUG",
    },
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:op read op://Personal/Gemini/credential --no-newline",
          },
          schema = {
            model = {
              default = "gemini-2.5-pro-exp-03-25",
            },
          },
        })
      end,

      openai = function()
        return require("codecompanion.adapters").extend("openai", {
          env = {
            api_key = "cmd:op read op://personal/OpenAI/secret --no-newline",
          },
        })
      end
    }
  },
  keys = {
    { "<leader> ", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, noremap = true, silent = true },
  },
}
