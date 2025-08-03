local function colorize(color)
  color = color or "rose-pine"

  vim.cmd.colorscheme(color)
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup({ style = "night" })
      colorize("tokyonight")
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
    config = function ()
      vim.g.material_style = "palenight"
    end
  },
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    lazy = true
  } 
}
