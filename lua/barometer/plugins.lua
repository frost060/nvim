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
  use "nvim-telescope/telescope-fzf-native.nvim"

  -- Add git related info in the signs columns and popups
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, disable = false }
  --use "airblade/vim-gitgutter"
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "mfussenegger/nvim-lint"
  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client

  use { "hrsh7th/nvim-compe", disable = false }
  use "glepnir/lspsaga.nvim"
  use "folke/which-key.nvim"

  use { "sainnhe/gruvbox-material", disable = false }

  use "mfussenegger/nvim-jdtls"

  use "norcalli/nvim-colorizer.lua"
  use "fatih/vim-go"

  use "tamago324/lir.nvim"
  use "tamago324/lir-git-status.nvim"

  use "sainnhe/everforest"

  use "github/copilot.vim"
  use "morhetz/gruvbox"

  use "nvim-lua/lsp_extensions.nvim"

  use "sbdchd/neoformat"
end)
