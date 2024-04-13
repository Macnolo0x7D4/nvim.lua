local setup, autopairs = pcall(require, 'nvim-autopairs')

if not setup then
  print("Autopairs not setup")
  return
end

autopairs.setup({
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false
  },
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")

local setup_cmp, cmp = pcall(require, "cmp")

if not setup_cmp then
  print("CMP not setup")
  return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
