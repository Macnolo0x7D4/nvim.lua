local setup_lsp, lsp = pcall(require, "lsp-zero")

if not setup_lsp then
  print("LSP not setup")
  return
end

lsp.preset("recommended")

lsp.ensure_installed({
  "clangd",
  "cssls",
  "elixirls",
  "emmet_language_server",
  "eslint",
  "gopls",
  "jdtls",
  "jsonls",
  "kotlin_language_server",
  "lua_ls",
  "tailwindcss",
  "tsserver"
})

lsp.nvim_workspace()

local setup_cmp, cmp = pcall(require, "cmp")

if not setup_cmp then
  print("CMP not setup")
  return
end

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
  ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
  ["<Tab>"] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

local setup_lspkind, lspkind = pcall(require, "lspkind")

if not setup_lspkind then
  print("lspkind not setup")
  return
end

lsp.setup_nvim_cmp({
  mapping = cmp_mappings,
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol',
      maxwidth = 50,
      ellipsis_char = '...',
    })
  }
})

lsp.set_preferences({
  suggest_lsp_servers = false
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

local setup_mix, mix = pcall(require, "mix")

if not setup_mix then
  print("Mix not setup")
  return
end

mix.setup()
