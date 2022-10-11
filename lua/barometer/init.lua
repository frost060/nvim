require "barometer.plugins"
require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"
require "barometer.treesitter-context"

require("which-key").setup {}
require("gitsigns").setup()
require("nvim-autopairs").setup {}

vim.cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("barometer.stylua").format()
  augroup END
]]
