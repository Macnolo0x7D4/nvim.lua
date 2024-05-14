return {
  "vim-test/vim-test",
  config = function()
    vim.keymap.set("n", "<leader>t", vim.cmd.TestNearest)
    vim.keymap.set("n", "<leader>tf", vim.cmd.TestFile)
    vim.keymap.set("n", "<leader>T", vim.cmd.TestSuite)
  end
}
