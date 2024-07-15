return {
  "alexghergh/nvim-tmux-navigation",
  config = function()
    vim.g.tmux_navigator_no_mappings = 1

    local nvim_tmux_nav = require('nvim-tmux-navigation')

    nvim_tmux_nav.setup {
      disable_when_zoomed = true
    }

    vim.keymap.set('n', "<leader>wh", nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set('n', "<leader>wj", nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set('n', "<leader>wk", nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set('n', "<leader>wl", nvim_tmux_nav.NvimTmuxNavigateRight)
    vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    vim.keymap.set('n', "<leader><Tab>", nvim_tmux_nav.NvimTmuxNavigateNext)
  end
}
