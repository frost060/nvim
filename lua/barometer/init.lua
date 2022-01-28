require "barometer.plugins"

require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"

require("which-key").setup {}

local cmd = vim.cmd
local fn = vim.fn

if fn.executable "stylua" == 0 then
  return
end

cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("barometer.stylua").format()
  augroup END
]]

--Put this lines inside your vimrc to set the colorscheme
--require("nebulous").setup {
--variant = "night",
--disable = {
--background = true,
--endOfBuffer = false,
--terminal_colors = false,
--},
--italic = {
--comments = false,
--keywords = true,
--functions = false,
--variables = true,
--},
--custom_colors = { -- this table can hold any group of colors with their respective values
--LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },
--CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },

---- it is possible to specify only the element to be changed
--TelescopePreviewBorder = { fg = "#A13413" },
--LspDiagnosticsDefaultError = { bg = "#E11313" },
--TSTagDelimiter = { style = "bold,italic" },
--},
--}

require("colorbuddy").colorscheme "gruvbuddy"
