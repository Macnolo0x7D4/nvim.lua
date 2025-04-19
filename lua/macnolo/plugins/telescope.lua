return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = {
    "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope-project.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  config = function()
    local telescope = require('telescope')
    telescope.setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        project = {
          base_dirs = {
            { path = '~/Code', max_depth = 2 },
          }
        }
      }
    })

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    vim.keymap.set('n', '<leader>fp', telescope.extensions.project.project, {})

    vim.keymap.set('n', '<leader>f ', telescope.extensions.harpoon.marks, {})
  end
}
