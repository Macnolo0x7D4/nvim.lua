return {
  {
    "brendalf/mix.nvim",
    cmd = "Mix",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    opts = {},
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "jfpedroza/neotest-elixir",
    },
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
  },
}
