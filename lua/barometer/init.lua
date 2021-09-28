require "barometer.plugins"
require "barometer.settings"
require "barometer.colors"

require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"

require "barometer.nvimtree"

require("which-key").setup {}

require "barometer.keybindings"

require("gitsigns").setup()

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

