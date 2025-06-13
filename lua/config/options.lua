vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.wrap = false

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.clipboard:append("unnamedplus")

if vim.g.neovide then
  vim.o.guifont = "BerkeleyMono Nerd Font:h12"
  vim.opt.linespace = 3
end
