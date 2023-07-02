vim.opt.termguicolors = false
vim.opt.background = "dark"

-- require("onedark").setup()

-- vim.cmd.colorscheme "onedark"

-- require('colorbuddy').colorscheme('gruvbuddy')

-- vim.cmd("colorscheme accent")
-- vim.cmd("hi Normal guibg=#101010")

-- vim.cmd("hi @variable guifg=#e0e0e0")
-- vim.cmd("hi @parameter guifg=#e0e0e0")

-- vim.cmd("hi @constant guifg=#e06060")
-- vim.cmd("hi @number guifg=#e06060")
-- vim.cmd("hi @function guifg=#e06060")
-- vim.cmd("hi @string guifg=#e06060")
-- vim.cmd("hi @macro guifg=#e06060")

-- vim.cmd("hi @type guifg=#e5c07b")
-- vim.cmd("hi @conditional guifg=#e5c07b")
-- vim.cmd("hi @keyword guifg=#e5c07b")
-- vim.cmd("hi @loop guifg=#e5c07b")
-- vim.cmd("hi @repeat guifg=#e5c07b")
-- vim.cmd("hi @operator guifg=#e5c07b")
-- vim.cmd("hi @punctuation guifg=#e5c07b")
-- vim.cmd("hi @storageclass guifg=#e5c07b")

require("colorbuddy").colorscheme "gruvbuddy"

local Color = require("colorbuddy").Color
Color.new("gray0", "#151515")

-- vim.cmd "colorscheme catppuccin_mocha"
-- vim.cmd "colorscheme rose-pine"

-- local h = require("rose-pine.util").highlight
-- local p = require "rose-pine.palette"

-- -- hide `~`s at end of buffer
-- h("EndOfBuffer", { fg = p.base })

-- -- subtle indentation guides
-- h("IndentBlankline", { fg = p.highlight_low, nocombine = true })

-- -- telescope
-- h("TelescopePromptBorder", { fg = p.highlight_high, bg = p.base })
-- h("TelescopePromptNormal", { fg = p.highlight_high, bg = p.base })
-- h("TelescopePreviewBorder", { fg = p.highlight_high, bg = p.base })
-- h("TelescopePreviewNormal", { fg = p.highlight_high, bg = p.base })
-- h("TelescopeResultsBorder", { fg = p.highlight_high, bg = p.base })
-- h("TelescopeResultsNormal", { fg = p.highlight_high, bg = p.base })
