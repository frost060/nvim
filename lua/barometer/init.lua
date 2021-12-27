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

