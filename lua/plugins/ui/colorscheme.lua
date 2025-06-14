local function colorize(color)
  color = color or "rose-pine"

  vim.cmd.colorscheme(color)

  --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    config = function()
      require("tokyonight").setup({style = "moon"})
    end
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha"
      })

      colorize("catppuccin")
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
