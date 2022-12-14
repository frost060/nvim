require("nvim-treesitter.configs").setup {
  ensure_installed = "all",
  highlight = {
    enable = true, -- false will disable the whole extension
  },
  indent = {
    enable = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "vin",
      node_incremental = "vni",
      scope_incremental = "vsi",
      node_decremental = "vnd",
    },
  },
  auto_install = true,
  textobjects = {
    move = {
      enable = true,
    },
  },
}
