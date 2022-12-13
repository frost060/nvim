require "barometer.color"
require "barometer.treesitter"
require "barometer.lsp"
require "barometer.lir"
require "barometer.stylua"

vim.cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("barometer.stylua").format()
  augroup END
]]
