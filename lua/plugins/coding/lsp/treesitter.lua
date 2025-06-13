return {
  "nvim-treesitter/nvim-treesitter",
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
        "html",
        "css",
        "javascript",
        "typescript",
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
