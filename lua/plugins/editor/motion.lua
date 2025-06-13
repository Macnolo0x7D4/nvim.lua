return {
  {
    "phaazon/hop.nvim",
    branch = 'v2',
    config = function()
      local hop = require('hop')

      hop.setup({})

      vim.keymap.set('n', '<leader>hl', function()
        hop.hint_char1({ current_line_only = true })
      end)

      vim.keymap.set('n', '<leader>hd', function()
        hop.hint_char2({ current_line_only = false })
      end)
    end
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
        ts_config = {
          lua = { "string" },
          javascript = { "template_string" },
          java = false
        },
      })
    end
  },
  {
    "tpope/vim-surround"
  },
  {
    "preservim/nerdcommenter"
  }
}
