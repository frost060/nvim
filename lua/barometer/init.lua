require "barometer.plugins"
require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.set"
require "barometer.formatter"
-- require "barometer.barbar"
require "barometer.incline"
-- require "barometer.lualine"

require("which-key").setup {}
require("nvim-autopairs").setup {}
require("nvim-nonicons").setup {}

-- vim.cmd.colorscheme 'onedark'

require("tokyonight").setup {
    style = "moon",
    transparent = true,
    styles = {
        sidebars = "transparent",
        floats = "transparent",
        comments = { italic = true },
        keywords = { italic = true }
    },
    sidebars = {
        "qf",
        "vista_kind",
        "terminal",
        "spectre_panel",
        "startuptime",
        "Outline",
    },
    on_highlights = function(hl, c)
        hl.CursorLineNr = { fg = c.orange, bold = true }
        hl.LineNr = { fg = c.orange, bold = true }
        hl.LineNrAbove = { fg = c.fg_gutter }
        hl.LineNrBelow = { fg = c.fg_gutter }
        local prompt = "#2d3149"
        hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
        hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopePromptNormal = { bg = prompt }
        hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
        hl.TelescopePromptTitle = { bg = c.fg_gutter, fg = c.orange }
        hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
        hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }
    end,
}
vim.cmd [[colorscheme tokyonight]]

-- require('colorbuddy').colorscheme('gruvbuddy')
-- local Color = require("colorbuddy").Color
-- Color.new("gray0", "#151515")

