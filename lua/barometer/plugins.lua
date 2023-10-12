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
    use "tpope/vim-fugitive"     -- Git commands in nvim
    use "tpope/vim-commentary"
    use "tpope/vim-surround"
    use "windwp/nvim-autopairs"

    -- UI to select things (files, grep results, open buffers...)

    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use "nvim-treesitter/nvim-treesitter"
    use "nvim-telescope/telescope-fzf-native.nvim"
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    }
    use "nvim-treesitter/playground"

    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/nvim-compe"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/cmp-nvim-lua"
    use "folke/which-key.nvim"

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"

    -- use "tamago324/lir.nvim"
    -- use "tamago324/lir-git-status.nvim"

    use "sbdchd/neoformat"
    use "mhartington/formatter.nvim"

    use "github/copilot.vim"

    use "neovim/nvim-lspconfig"
    use {
        "williamboman/mason.nvim",
    }
    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" }, -- Required
            {                            -- Optional
                "williamboman/mason.nvim",
                run = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
            { "williamboman/mason-lspconfig.nvim" }, -- Optional

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },     -- Required
            { "hrsh7th/cmp-nvim-lsp" }, -- Required
            { "L3MON4D3/LuaSnip" },     -- Required
        },
    }

    use "jose-elias-alvarez/null-ls.nvim"

    use {
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    }
    use {
        "Wansmer/treesj",
        requires = { "nvim-treesitter" },
        config = function()
            require("treesj").setup { --[[ your config ]]
            }
        end,
    }

    use "navarasu/onedark.nvim"
    use "cocopon/iceberg.vim"
    -- use "monsonjeremy/onedark.nvim"

    -- use {
    --     "tjdevries/express_line.nvim",
    --     requires = {
    --         "j-hui/fidget.nvim",
    --         tag = "legacy",
    --     },
    -- }

    use {
        "tjdevries/gruvbuddy.nvim",
        requires = {
            "tjdevries/colorbuddy.nvim",
        },
    }

    use "Alligator/accent.vim"

    use "catppuccin/vim"

    -- use {
    --     "yamatsum/nvim-nonicons",
    --     requires = { "kyazdani42/nvim-web-devicons" },
    -- }

    use { "rose-pine/neovim", as = "rose-pine" }
    use "norcalli/nvim-colorizer.lua"

    use {
        "nvim-telescope/telescope-file-browser.nvim",
        requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    }

    -- use "lewis6991/gitsigns.nvim"

    use "gruvbox-community/gruvbox"

    use "Shatur/neovim-ayu"

    use "pwntester/octo.nvim"
    use {
        "mcchrish/zenbones.nvim",
        -- Optionally install Lush. Allows for more configuration or extending the colorscheme
        -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
        -- In Vim, compat mode is turned on as Lush only works in Neovim.
        requires = "rktjmp/lush.nvim",
    }

    use "drsooch/gruber-darker-vim"

    use { "zbirenbaum/copilot.lua" }
    use "lewis6991/gitsigns.nvim"
    use "catppuccin/nvim"

    use {
        "yamatsum/nvim-nonicons",
        requires = { "kyazdani42/nvim-web-devicons" },
    }

    use { "tjdevries/express_line.nvim", requires = { "j-hui/fidget.nvim", tag = "legacy" } }

    use "bluz71/vim-nightfly-guicolors"

    use "folke/tokyonight.nvim"

    use {"romgrk/barbar.nvim", disable = true}

    use "b0o/incline.nvim"
    use "nvim-lualine/lualine.nvim"

    use "folke/neodev.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "shaunsingh/nord.nvim"
    use "rebelot/kanagawa.nvim"
    use "tamago324/lir.nvim"
    use "tamago324/lir-git-status.nvim"
end)
