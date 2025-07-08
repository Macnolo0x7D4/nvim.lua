return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "jdtls",
        "java-debug-adapter",
        "java-test",
        "google-java-format",
        "checkstyle"
      }
    }
  },
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
      local jdtls = require("jdtls")
      local root_dir = jdtls.setup.find_root({".git", "mvnw", "gradlew", "pom.xml", "build.gradle"})
      local home = os.getenv("HOME")
      local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

      local config = {
        cmd = {
          "java",
          "-Declipse.application=org.eclipse.jdt.ls.core.id1",
          "-Dosgi.bundles.defaultStartLevel=4",
          "-Declipse.product=org.eclipse.jdt.ls.core.product",
          "-Dlog.protocol=true",
          "-Dlog.level=ALL",
          "-Xmx1g",
          "--add-modules=ALL-SYSTEM",
          "--add-opens", "java.base/java.util=ALL-UNNAMED",
          "--add-opens", "java.base/java.lang=ALL-UNNAMED",
          "-jar", vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
          "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
          "-data", workspace_dir
        },
        root_dir = root_dir,
        settings = {
          java = {
            eclipse = {
              downloadSources = true,
            },
            configuration = {
              updateBuildConfiguration = "interactive",
            },
            maven = {
              downloadSources = true,
            },
            implementationsCodeLens = {
              enabled = true,
            },
            referencesCodeLens = {
              enabled = true,
            },
            references = {
              includeDecompiledSources = true,
            },
            format = {
              enabled = true,
              settings = {
                url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
                profile = "GoogleStyle",
              },
            },
          },
          signatureHelp = { enabled = true },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
            importOrder = {
              "java",
              "javax",
              "com",
              "org"
            },
          },
          extendedClientCapabilities = jdtls.extendedClientCapabilities,
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
          codeGeneration = {
            toString = {
              template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
            },
            useBlocks = true,
          },
        },
        init_options = {
          bundles = {}
        },
        on_attach = function(client, bufnr)
          jdtls.setup_dap({ hotcodereplace = "auto" })
          require("jdtls.dap").setup_dap_main_class_configs()
          
          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "<leader>co", jdtls.organize_imports, opts)
          vim.keymap.set("n", "<leader>crv", jdtls.extract_variable, opts)
          vim.keymap.set("n", "<leader>crc", jdtls.extract_constant, opts)
          vim.keymap.set("v", "<leader>crm", [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
          vim.keymap.set("n", "<leader>tc", jdtls.test_class, opts)
          vim.keymap.set("n", "<leader>tm", jdtls.test_nearest_method, opts)
        end,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      }

      jdtls.start_or_attach(config)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "williamboman/mason.nvim",
        opts = {
          ensure_installed = {
            "java-debug-adapter",
            "java-test",
          }
        }
      }
    }
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "rcasia/neotest-java",
    },
    opts = {
      adapters = {
        ["neotest-java"] = {}
      }
    }
  }
}
