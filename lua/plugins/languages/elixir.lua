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
        ["neotest-elixir"] = {
          mix_task = "test",
          extra_block_identifiers = { "describe", "context", "feature", "scenario", "given", "when", "then" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ft = { "elixir", "eex", "heex", "surface" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir", "heex", "eex", "surface" })
    end
  }
}
