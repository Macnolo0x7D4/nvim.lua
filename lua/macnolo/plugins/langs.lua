return {
  {
    "lervag/vimtex"
  },
  {
    "tpope/vim-dadbod"
  },
  {
    "brendalf/mix.nvim",
    cmd = "Mix",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function ()
      require("mix").setup()
    end
  }
}
