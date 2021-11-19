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

  use "navarasu/onedark.nvim"
  use "Th3Whit3Wolf/one-nvim"

  -- Add git related info in the signs columns and popups
  use { "lewis6991/gitsigns.nvim", requires = { "nvim-lua/plenary.nvim" }, disable = true }
  --use "airblade/vim-gitgutter"
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use "nvim-treesitter/nvim-treesitter"
  use "nvim-treesitter/nvim-treesitter-textobjects"
  use "mfussenegger/nvim-lint"
  use "neovim/nvim-lspconfig" -- Collection of configurations for built-in LSP client

  use { "hrsh7th/nvim-compe", disable = false }
  use "glepnir/lspsaga.nvim"
  use "folke/which-key.nvim"

  use { "tjdevries/express_line.nvim", disable = false }
  use { "tjdevries/colorbuddy.nvim", disable = false }
  use { "tjdevries/gruvbuddy.nvim", disable = false }

  use { "sainnhe/gruvbox-material", disable = false }
  use { "tjdevries/cyclist.vim", disable = true }

  use "folke/tokyonight.nvim"
  use "Th3Whit3Wolf/onebuddy"

  use "mfussenegger/nvim-jdtls"

  use "norcalli/nvim-colorizer.lua"
  use "fatih/vim-go"

  use "tamago324/lir.nvim"
  use "tamago324/lir-git-status.nvim"

  use "arzg/vim-colors-xcode"

  use "sainnhe/everforest"

  use "NLKNguyen/papercolor-theme"

  use "github/copilot.vim"
  use "morhetz/gruvbox"

  use "nvim-lua/lsp_extensions.nvim"

  -- Base16 themes
  use "chriskempson/base16-vim"

  --use "vim-airline/vim-airline"
  --use "vim-airline/vim-airline-themes"

  use "kyazdani42/nvim-web-devicons"

  use {
    "nvim-lualine/lualine.nvim",
    wants = "nvim-web-devicons",
    disable = true,
  }

  use {
    "kdheepak/tabline.nvim",
    config = function()
      require("tabline").setup {
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          section_separators = { "", "" },
          component_separators = { "", "" },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = true, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = true, -- shows base filename only instead of relative path in filename
        },
      }
      vim.cmd [[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
  ]]
    end,
    disable = true,
  }

  use "sbdchd/neoformat"
  use "Yggdroot/indentLine"

  use "vim-airline/vim-airline"
  use "vim-airline/vim-airline-themes"

  use "jacoborus/tender.vim"

  use "sainnhe/edge"
  use "sainnhe/sonokai"

  use "edkolev/tmuxline.vim"
end)
