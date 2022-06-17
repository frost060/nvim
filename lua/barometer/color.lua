local vscode = false
if vscode then
  vim.g.vscode_style = "dark"
  -- Enable transparent background
  vim.g.vscode_transparent = 1
  -- Enable italic comment
  vim.g.vscode_italic_comment = 0
  vim.cmd [[colorscheme vscode]]
end

local onedark = false
if onedark then
  require("onedark").setup {
    transparent = true,
    transparent_sidebar = true,
    comment_style = "NONE",
    keyword_style = "NONE",
    function_style = "NONE",
    variable_style = "NONE",
  }
end

local catppuccin = false
if catppuccin then
  vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
  require("catppuccin").setup {
    transparent_background = true,
    term_colors = true,
    styles = {
      comments = "NONE",
      conditionals = "NONE",
      loops = "NONE",
      functions = "NONE",
      keywords = "NONE",
      strings = "NONE",
      variables = "NONE",
      numbers = "NONE",
      booleans = "NONE",
      properties = "NONE",
      types = "NONE",
      operators = "NONE",
    },
  }
  vim.cmd [[colorscheme catppuccin]]
end

local tokyonight = true
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

local material = false
if material then
  vim.g.material_disable_background = true
  vim.g.material_style = "deep ocean"
  vim.cmd "colorscheme material"
end
