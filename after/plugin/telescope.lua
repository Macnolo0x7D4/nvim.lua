local setup, telescope = pcall(require, 'telescope')

if not setup then
  print("Telescope not setup")
  return
end

telescope.setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    project = {
      base_dirs = {
        { path = '~/Documents/Code', max_depth = 2 },
      }
    }
  }
}

telescope.load_extension('fzf')
telescope.load_extension('harpoon')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project, {})

vim.keymap.set('n', '<leader>f ', telescope.extensions.harpoon.marks, {})
