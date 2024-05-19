return {
  "ThePrimeagen/harpoon",
  config = function()
    local harpoon_mark = require('harpoon.mark')
    local harpoon_ui = require('harpoon.ui')

    vim.keymap.set('n', '<leader>ha', harpoon_mark.add_file, {})
    vim.keymap.set('n', '<leader>hn', harpoon_ui.nav_next, {})
    vim.keymap.set('n', '<leader>hp', harpoon_ui.nav_prev, {})
  end
}
