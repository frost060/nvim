require "barometer.plugins"

require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"

require("which-key").setup {}
require("gitsigns").setup()

-- Catppuccin needs termguicolors set
vim.cmd [[ set termguicolors ]]
require("feline").setup {
  components = require "catppuccin.core.integrations.feline",
}

local fn = vim.fn

if fn.executable "stylua" == 0 then
  return
end

vim.cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("barometer.stylua").format()
  augroup END
]]
