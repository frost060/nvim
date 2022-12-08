require "barometer.plugins"
require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"
require "barometer.treesitter-context"
require "barometer.lualine"
require "barometer.color"
require "barometer.nvimtree"

require("which-key").setup {}
require("gitsigns").setup()
require("nvim-autopairs").setup {}

vim.cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("barometer.stylua").format()
  augroup END
]]

vim.cmd [[
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
]]
