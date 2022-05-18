require "barometer.plugins"

require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"
require "barometer.color"
require "barometer.nvimtree"

require("which-key").setup {}
require("gitsigns").setup()
require("nvim-autopairs").setup {}

-- -- Catppuccin needs termguicolors set
vim.opt.termguicolors = true
require("feline").setup {
  components = require "catppuccin.core.integrations.feline",
}

require("bufferline").setup {}

local fn = vim.fn

if fn.executable "stylua" == 0 then
  return
end

vim.cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("barometer.stylua").format()
  augroup END
]]
