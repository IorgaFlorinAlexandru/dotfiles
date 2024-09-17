 require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "javascript",
      "typescript",
      "angular",
      "c",
      "lua",
      "cpp",
      "html",
      "css",
      "json",
      "python",
      "rust"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
