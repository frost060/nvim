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

require("bufferline").setup {
  options = {
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "none",
    },
    modified_icon = "",
    close_icon = "",
    show_buffer_icons = false, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    show_buffer_default_icon = false, -- whether or not an unrecognised filetype should show a default icon
    show_close_icon = true,
    show_tab_indicators = false,
    show_duplicate_prefix = false, -- whether to show duplicate buffer prefix
  },
  highlights = {
    buffer_selected = {
      italic = false,
      bold = false,
    },
  },
}

require("lualine").setup {
  options = {
    icons_enabled = false,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
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
