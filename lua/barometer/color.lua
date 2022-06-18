local tokyonight = false
if tokyonight then
  vim.g.tokyonight_terminal_colors = true
  vim.g.tokyonight_style = "night"
  vim.g.tokyonight_italic_functions = false
  vim.g.tokyonight_italic_comments = false
  vim.g.tokyonight_italic_keywords = false
  vim.g.tokyonight_italic_variables = false
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
  vim.g.tokyonight_transparent_sidebar = true
  vim.g.tokyonight_transparent = true
  vim.g.tokyonight_dark_float = false
  vim.g.tokyonight_dark_sidebar = false
  vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
  vim.cmd [[colorscheme tokyonight]]
end

-- require('colorbuddy').colorscheme('gruvbuddy')
