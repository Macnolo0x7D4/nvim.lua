local setup_mark, harpoon_mark = pcall(require, 'harpoon.mark')

if not setup_mark then
  print("Harpoon not setup")
  return
end

local setup_ui, harpoon_ui = pcall(require, 'harpoon.ui')

if not setup_ui then
  print("Harpoon UI not setup")
  return
end

vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file, {})
vim.keymap.set('n', '<leader>hn', harpoon_ui.nav_next, {})
vim.keymap.set('n', '<leader>hp', harpoon_ui.nav_prev, {})
