require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "c",
    "lua",
    "rust",
    "cmake",
    "cpp",
    "css",
    "comment",
    "bash",
    "dockerfile",
    "dot",
    "elixir",
    "erlang",
    "go",
    "gomod",
    "gowork",
    "graphql",
    "hcl",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "ninja",
    "ocaml",
    "ocamllex",
    "prisma",
    "python",
    "ruby",
    "scala",
    "svelte",
    "toml",
    "typescript",
    "vim",
    "vue",
    "yaml",
    "zig",
  },
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  -- indent = {
  --   enable = true
  -- },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "vin",
      node_incremental = "vni",
      scope_incremental = "vsi",
      node_decremental = "vnd",
    },
  },

  textobjects = {
    move = {
      enable = true,
    },
  },
}
