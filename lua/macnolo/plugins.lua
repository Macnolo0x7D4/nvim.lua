vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.2',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'nvim-tree/nvim-tree.lua'
  use 'nvim-tree/nvim-web-devicons'
end)
