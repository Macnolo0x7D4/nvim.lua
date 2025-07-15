return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "jfpedroza/neotest-elixir"
  },
  keys = {
    {"<leader>tt", function() require("neotest").run.run() end},
    {"<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end},
    {"<leader>T", vim.cmd.TestSuite}
  },
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-elixir")({
          mix_task = "test",
          extra_block_identifiers = { "describe", "context", "feature", "scenario", "given", "when", "then" },
        }),
      },
    })
  end
}
