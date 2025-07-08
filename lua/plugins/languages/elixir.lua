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
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      
      lspconfig.elixirls.setup({
        cmd = { "elixir-ls" },
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, opts)
          
          if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          end
        end,
        settings = {
          elixirLS = {
            mixEnv = "dev",
            fetchDeps = false,
            enableTestLenses = true,
            suggestSpecs = true,
            dialyzerEnabled = true,
            dialyzerWarnOpts = {
              "error_handling",
              "no_behaviours",
              "no_contracts",
              "no_fail_call",
              "no_fun_app",
              "no_improper_lists",
              "no_match",
              "no_missing_calls",
              "no_opaque",
              "no_return",
              "no_undefined_callbacks",
              "no_unused",
              "underspecs",
              "unknown",
              "unmatched_returns",
              "overspecs",
              "specdiffs",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "elixir", "heex", "eex", "surface" })
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        elixir = { "mix" },
        heex = { "mix" },
        eex = { "mix" },
        surface = { "mix" },
      },
      formatters = {
        mix = {
          command = "mix",
          args = { "format", "-" },
          stdin = true,
        },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        elixir = { "credo" },
      },
    },
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          vim.list_extend(opts.ensure_installed, { "elixir-ls" })
        end,
      },
    },
    opts = function()
      local dap = require("dap")
      dap.adapters.elixir = {
        type = "executable",
        command = "elixir-ls",
        args = {},
      }
      dap.configurations.elixir = {
        {
          type = "elixir",
          name = "Elixir Debug",
          request = "launch",
          projectDir = "${workspaceFolder}",
          requireFiles = {
            "test/**/test_helper.exs",
            "test/**/*_test.exs",
          },
        },
      }
    end,
  },
}
