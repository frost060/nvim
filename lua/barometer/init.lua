require "barometer.plugins"
require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"
require "barometer.treesitter-context"
require "barometer.lualine"
require "barometer.color"

require("which-key").setup {}
require("gitsigns").setup()
require("nvim-autopairs").setup {}

vim.cmd [[
  augroup StyluaAuto
    autocmd BufWritePre *.lua :lua require("barometer.stylua").format()
  augroup END
]]

-- local statusline = require "statusline"
-- statusline.enable = true
-- statusline.lsp_diagnostics = true
-- statusline.ale_diagnostics = false

-- require("colorbuddy").colorscheme "gruvbuddy"
