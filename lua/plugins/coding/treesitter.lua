return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c",
        "cpp",
        "java",
        "kotlin",
        "lua",
        "vim",
        "elixir",
        "erlang",
        "heex",
        "eex",
        "html",
        "css",
        "javascript",
        "typescript",
        "gitcommit",
        "gitignore",
        "go",
        "rust",
        "markdown",
        "markdown_inline",
        "yaml"
      },
      sync_install = false,
      indent = {
        enable = true
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
    })
  end
}
