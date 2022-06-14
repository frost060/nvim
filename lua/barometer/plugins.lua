local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require("packer").use

require("packer").startup(function()
  use "wbthomason/packer.nvim" -- Package manager
  use "tpope/vim-fugitive" -- Git commands in nvim
  use "tpope/vim-commentary"
  use "tpope/vim-surround"
  use "windwp/nvim-autopairs"

  -- UI to select things (files, grep results, open buffers...)
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use { "nvim-telescope/telescope-ui-select.nvim" }
  use { "nvim-telescope/telescope-smart-history.nvim" }

  use "rcarriga/nvim-notify"

  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  }

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "mfussenegger/nvim-lint"
  use "nvim-lua/completion-nvim"
  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client

  use { "hrsh7th/nvim-compe", disable = false }
  use "glepnir/lspsaga.nvim"
  use "folke/which-key.nvim"

  use "mfussenegger/nvim-jdtls"

  use "ziglang/zig.vim"
  use "simrat39/rust-tools.nvim"
  use "rust-lang/rust.vim"

  use "nanotee/sqls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use "windwp/nvim-ts-autotag"

  use "tamago324/lir.nvim"
  use "tamago324/lir-git-status.nvim"

  use "nvim-lua/lsp_extensions.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  use "sbdchd/neoformat"

  -- Themes
  use "gruvbox-community/gruvbox"
  use "tjdevries/colorbuddy.vim"
  use "tjdevries/gruvbuddy.nvim"
  use "norcalli/nvim-colorizer.lua"

  use "AndrewRadev/splitjoin.vim"

  use "vim-test/vim-test"

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      {
        -- Snippets
        "L3MON4D3/LuaSnip",
        requires = {
          "saadparwaiz1/cmp_luasnip",
          "rafamadriz/friendly-snippets",
        },
      },
    },
  }
  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  }

  use "onsails/lspkind-nvim"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"

  use "folke/trouble.nvim"

  use "ful1e5/onedark.nvim"

  use "Mofiqul/vscode.nvim"
  use "tpope/vim-vividchalk"
  -- use "akinsho/bufferline.nvim"

  -- use "kyazdani42/nvim-web-devicons"

  use {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  use "folke/tokyonight.nvim"
  use "marko-cerovac/material.nvim"
  use "catppuccin/nvim"
  use "feline-nvim/feline.nvim"
  use "fxn/vim-monochrome"
  use "Lokaltog/vim-monotone"

  use "marciomazza/vim-brogrammer-theme"
  use "shaunsingh/nord.nvim"
end)
