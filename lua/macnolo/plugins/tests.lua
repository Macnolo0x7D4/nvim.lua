return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir"
  },
  config = function(opts)
    require("neotest").setup({
      adapters = {
        require("neotest-elixir")({}),
      }
    })

    vim.keymap.set("n", "<leader>t", function()
      require("neotest").run.run()
    end)

    vim.keymap.set("n", "<leader>tf", function()
      require("neotest").run.run(vim.fn.expand("%"))
    end)
    --vim.keymap.set("n", "<leader>T", vim.cmd.TestSuite)
  end
}
