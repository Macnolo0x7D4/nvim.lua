local setup, treesitter = pcall(require, "nvim-treesitter.configs")

if not setup then
  print("Treesitter not setup")
  return
end

treesitter.setup({
  ensure_installed = {
    "c",
    "cpp",
    "java",
    "lua",
    "vim",
    "elixir",
    "erlang",
    "heex",
    "html",
    "css",
    "javascript",
    "typescript",
    "svelte"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
})
