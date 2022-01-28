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
  use "scrooloose/nerdcommenter"
  use "tpope/vim-fugitive" -- Git commands in nvim
  use "tpope/vim-surround"
  use "jiangmiao/auto-pairs"
  -- UI to select things (files, grep results, open buffers...)
  use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } } }
  use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

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

  use "norcalli/nvim-colorizer.lua"

  --use "fatih/vim-go"
  use "ziglang/zig.vim"

  use "simrat39/rust-tools.nvim"
  use "rust-lang/rust.vim"

  use "nanotee/sqls.nvim"

  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use "windwp/nvim-ts-autotag"

  use "tamago324/lir.nvim"
  use "tamago324/lir-git-status.nvim"

  --use "github/copilot.vim"

  use "nvim-lua/lsp_extensions.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  use "sbdchd/neoformat"

  -- Themes
  use "jonathanfilip/vim-lucius"
  use "gruvbox-community/gruvbox"
  use "eemed/sitruuna.vim"

  use "AndrewRadev/splitjoin.vim"

  use "vim-test/vim-test"

  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-vsnip"
  use "hrsh7th/nvim-cmp"

  use "onsails/lspkind-nvim"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  use "tjdevries/colorbuddy.vim"
  use "tjdevries/gruvbuddy.nvim"

  use "tjdevries/express_line.nvim"
  use "j-hui/fidget.nvim"

  use "tjdevries/cyclist.vim"

  use "folke/trouble.nvim"

  use "sainnhe/everforest"
  use "kyazdani42/nvim-web-devicons"
end)
