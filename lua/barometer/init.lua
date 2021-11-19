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

--Set statusbar
--require("lualine").setup {
--options = {
--theme = "gruvbox",
--section_separators = { left = "", right = "" },
--component_separators = { left = "", right = "" },
----section_separators = { left = "", right = "" },
----component_separators = { left = "", right = "" },
--icons_enabled = true,
--},
--sections = {
--lualine_a = { "mode" },
--lualine_b = { "branch" },
--lualine_c = { { "diagnostics", sources = { "nvim_lsp" } }, "filename" },
--lualine_y = { "progress" },
--},
--extensions = { "nvim-tree" },
--}

--require("gitsigns").setup()

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

cmd [[
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
]]
