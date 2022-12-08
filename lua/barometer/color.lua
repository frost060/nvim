vim.opt.termguicolors = true
vim.opt.background = "dark"

require("tokyonight").setup {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  style = "storm", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "transparent", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  -- on_highlights = function(highlights, colors) end,
}

vim.cmd [[colorscheme tokyonight]]

-- local hl = function(thing, opts)
--   vim.api.nvim_set_hl(0, thing, opts)
-- end

-- hl("SignColumn", {
--   bg = "none",
-- })

-- hl("ColorColumn", {
--   ctermbg = 0,
--   bg = "#2B79A0",
-- })

-- hl("CursorLineNR", {
--   bg = "None",
-- })

-- hl("Normal", {
--   bg = "none",
-- })

-- hl("LineNr", {
--   fg = "#5eacd3",
-- })

-- hl("netrwDir", {
--   fg = "#5eacd3",
-- })

-- Lua
require("onedark").setup()
