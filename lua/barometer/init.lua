require "barometer.plugins"

require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.stylua"

require("which-key").setup {}

require "barometer.keybindings"

require("lualine").setup {
  options = {
    theme = "dracula",
    section_separators = { "", "" },
    component_separators = { "", "" },
    icons_enabled = false,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        sections = { "error", "warn" },
        symbols = { error = "E ", warn = "W " },
        colored = false, -- displays diagnostics status in color if set to true
        update_in_insert = false, -- Update diagnostics in insert mode
        always_visible = false, -- Show diagnostics even if count is 0, boolean or function returning boolean
      },
    },
    lualine_x = {
      "filetype",
    },
    lualine_y = { "progress" },
  },
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
