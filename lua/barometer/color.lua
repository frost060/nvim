local colors = require("colorbuddy.color").colors

vim.opt.termguicolors = true

local ns_barometer = vim.api.nvim_create_namespace "barometer_colors"
local ns_barometer_2 = vim.api.nvim_create_namespace "barometer_colors_2"

vim.api.nvim_set_decoration_provider(ns_barometer, {
  on_start = function(_, tick) end,

  on_buf = function(_, bufnr, tick) end,

  on_win = function(_, winid, bufnr, topline, botline) end,

  on_line = function(_, winid, bufnr, row)
    if row == 10 then
      vim.api.nvim__set_hl_ns(ns_barometer_2)
    else
      vim.api.nvim__set_hl_ns(ns_barometer)
    end
  end,

  on_end = function(_, tick) end,
})

vim.api.nvim_set_hl(ns_barometer, "LuaFunctionCall", {
  foreground = colors.green:to_rgb(),
  background = nil,
  reverse = false,
  underline = false,
})

vim.api.nvim__set_hl_ns(ns_barometer)
