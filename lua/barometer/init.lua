require "barometer.plugins"
require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"
require "barometer.color"
-- require "barometer.treesitter-context"

require("which-key").setup {}
require("gitsigns").setup()
require("nvim-autopairs").setup {}

-- -- Catppuccin needs termguicolors set
-- vim.opt.termguicolors = true
-- require("feline").setup {
--   components = require "catppuccin.core.integrations.feline",
-- }

-- require("bufferline").setup {}

require("lualine").setup {
  options = {
    icons_enabled = true,
  },
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

local zenmode_opts = {
  backdrop = 0.99,
  width = 0.7, -- width will be 85% of the editor width
}

require("zen-mode").setup {
  window = zenmode_opts,
}
