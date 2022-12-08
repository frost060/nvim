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

  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "mfussenegger/nvim-lint"
  use "nvim-lua/completion-nvim"

  use { "hrsh7th/nvim-compe", disable = false }
  use "folke/which-key.nvim"

  use "mfussenegger/nvim-jdtls"
  use "jose-elias-alvarez/typescript.nvim"

  use "ziglang/zig.vim"
  use "simrat39/rust-tools.nvim"
  use "rust-lang/rust.vim"

  use "nanotee/sqls.nvim"
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use "windwp/nvim-ts-autotag"

  use "tamago324/lir.nvim"
  use "tamago324/lir-git-status.nvim"

  use "jose-elias-alvarez/null-ls.nvim"

  use "sbdchd/neoformat"

  -- Themes
  use "gruvbox-community/gruvbox"
  use "folke/tokyonight.nvim"

  use "AndrewRadev/splitjoin.vim"

  use "vim-test/vim-test"
  use "neovim/nvim-lspconfig"
  use "lukas-reineke/lsp-format.nvim"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/nvim-cmp" --completion
  use { "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" }
  use "onsails/lspkind-nvim"
  use "nvim-lua/lsp_extensions.nvim"
  use "glepnir/lspsaga.nvim"
  use "simrat39/symbols-outline.nvim"
  use "L3MON4D3/LuaSnip"
  use "saadparwaiz1/cmp_luasnip"

  use {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  }

  use "hrsh7th/vim-vsnip"
  use "hrsh7th/vim-vsnip-integ"

  use {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  }

  use "ray-x/lsp_signature.nvim"

  use "kyazdani42/nvim-web-devicons"
  use "folke/lsp-trouble.nvim"

  use "tjdevries/colorbuddy.vim"
  use "tjdevries/gruvbuddy.nvim"
  use "norcalli/nvim-colorizer.lua"

  use "folke/lsp-colors.nvim"
  use {
    "svrana/neosolarized.nvim",
    requires = { "tjdevries/colorbuddy.nvim" },
  }

  use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig",
  }
  use {
    "nvim-lualine/lualine.nvim",
    disable = false,
  }

  -- use "dracula/vim"
  use "Mofiqul/dracula.nvim"
  -- use "lunarvim/horizon.nvim"
  use "ntk148v/vim-horizon"

  use { "tjdevries/cyclist.vim", disable = true }

  use "beauwilliams/flatbox"
  use "luisiacc/gruvbox-baby"
  use { "beauwilliams/statusline.lua", disable = true }

  use "kdheepak/lazygit.nvim"
  use "cocopon/iceberg.vim"
  use "tanvirtin/monokai.nvim"
  use "nvim-tree/nvim-tree.lua"

  use "monsonjeremy/onedark.nvim"

  use "voldikss/vim-floaterm"
end)
