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
  use "jiangmiao/auto-pairs"

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

  -- use "github/copilot.vim"

  use "nvim-lua/lsp_extensions.nvim"
  use "jose-elias-alvarez/null-ls.nvim"

  use "sbdchd/neoformat"

  -- Themes
  use "morhetz/gruvbox"
  use "tjdevries/colorbuddy.vim"
  use "tjdevries/gruvbuddy.nvim"
  use "norcalli/nvim-colorizer.lua"

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

  use "tjdevries/express_line.nvim"
  use "j-hui/fidget.nvim"

  -- use "tjdevries/cyclist.vim"

  use "folke/trouble.nvim"

  -- use "kyazdani42/nvim-web-devicons"
  --   use "ryanoasis/vim-devicons"

  use {
    "nvim-lualine/lualine.nvim",
    requires = { "rlch/github-notifications.nvim" },
    event = "VimEnter",
    config = [[require('barometer.config.lualine')]],
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
          show_bufnr = true, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false,
        },
      }
      vim.cmd [[
   set guioptions-=e " Use showtabline in gui vim
   set sessionoptions+=tabpages,globals " store tabpages and globals in session
   ]]
    end,
    disable = true,
  }

  use {
    "SmiteshP/nvim-gps",
    requires = "nvim-treesitter/nvim-treesitter",
    wants = "nvim-treesitter",
    module = "nvim-gps",
    config = function()
      require("nvim-gps").setup { separator = " " }
    end,
  }

  use "jnurmine/Zenburn"
  use "lfv89/vim-interestingwords"

  use "doums/darcula"
  use "tomasiser/vim-code-dark"

  use "folke/tokyonight.nvim"

  use "juanpabloaj/vim-pixelmuerto"
  use "ron-rs/ron.vim"
  use "drewtempelmeyer/palenight.vim"

  use "navarasu/onedark.nvim"

  -- use "glepnir/spaceline.vim"

  -- use "ful1e5/onedark.nvim"
end)
