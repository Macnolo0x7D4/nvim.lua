return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    config = function()
      require("kanagawa").load("wave")
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({ style = "night" })
      vim.cmd.colorscheme()
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
      require("catppuccin").setup({ flavour = "mocha" })
    end
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = true,
    config = function()
      require('rose-pine').setup()
    end
  },
  {
    "marko-cerovac/material.nvim",
    name = "material",
    lazy = true,
    config = function()
      vim.g.material_style = "palenight"
    end
  },
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    lazy = true
  }
}
