return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter"
  },
  config = function()
    local neotest = require("neotest")

    vim.keymap.set("n", "<leader>t", function()
      neotest.run.run()
    end)

    vim.keymap.set("n", "<leader>tf", function()
      neotest.run.run(vim.fn.expand("%"))
    end)
    --vim.keymap.set("n", "<leader>T", vim.cmd.TestSuite)
  end
}
