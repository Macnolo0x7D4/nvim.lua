local setup, nvim_tree = pcall(require, 'nvim-tree')

if not setup then
  print("Nvim-tree not setup")
  return
end

nvim_tree.setup()

local api = require("nvim-tree.api")

vim.keymap.set("n", "<leader>e", api.tree.toggle)
