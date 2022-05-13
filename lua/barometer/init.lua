require "barometer.plugins"

require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"
require "barometer.color"

require("which-key").setup {}
-- require("gitsigns").setup()

require("feline").setup {
  components = require "catppuccin.core.integrations.feline",
}

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
