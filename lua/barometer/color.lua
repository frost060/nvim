vim.g.tokyonight_dev = true
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_sidebars = {
  "qf",
  "vista_kind",
  "terminal",
  "packer",
  "spectre_panel",
  "NeogitStatus",
  "help",
}
vim.g.tokyonight_cterm_colors = false
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_dark_float = false
vim.g.tokyonight_colors = {}
-- vim.g.tokyonight_colors = { border = "orange" }

require("tokyonight").colorscheme()
