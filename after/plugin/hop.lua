local hop = require('hop')

hop.setup({})

vim.keymap.set('n', '<leader>hl', function()
  hop.hint_char1({ current_line_only = true })
end)

vim.keymap.set('n', '<leader>hd', function()
  hop.hint_char2({ current_line_only = false })
end)
