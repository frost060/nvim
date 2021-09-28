require("nvim-treesitter.configs").setup {
  ensure_installed = { "java", "javascript", "typescript", "elixir" },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
}

require("nvim-treesitter.configs").setup {
  playground = {
    enable = true,
    disable = {},
    updateTime = 25,
    persist_queries = false,
  },
}
