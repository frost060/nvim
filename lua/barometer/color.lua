local vscode = true
if vscode then
  vim.g.vscode_style = "dark"
  -- Enable transparent background
  vim.g.vscode_transparent = 1
  -- Enable italic comment
  vim.g.vscode_italic_comment = 1
  vim.cmd [[colorscheme vscode]]
end

local onedark = false
if onedark then
  require("onedark").setup {
    transparent = true,
    transparent_sidebar = true,
  }
end

local catppuccin = true
if catppuccin then
  require("catppuccin").setup {
    transparent_background = false,
    term_colors = true,
  }
end
