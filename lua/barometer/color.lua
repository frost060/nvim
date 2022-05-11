vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_comments = false
vim.g.tokyonight_transparent = true
vim.g.tokyonight_transparent_sidebar = true
vim.g.tokyonight_dark_sidebar = false
vim.g.tokyonight_dark_float = false

local tokyonight = false
if tokyonight then
  vim.cmd [[colorscheme tokyonight]]
end

local enableOneDarkPro = false
if enableOneDarkPro then
  local onedarkpro = require "onedarkpro"
  require("onedarlpro").setup {
    dark_theme = "onedark", -- The default dark theme
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    hlgroups = {}, -- Override default highlight groups
    filetype_hlgroups = {}, -- Override default highlight groups for specific filetypes
    plugins = { -- Override which plugins highlight groups are loaded
      native_lsp = true,
      treesitter = true,
    },
    options = {
      bold = true, -- Use the themes opinionated bold styles?
      italic = true, -- Use the themes opinionated italic styles?
      underline = false, -- Use the themes opinionated underline styles?
      undercurl = false, -- Use the themes opinionated undercurl styles?
      cursorline = false, -- Use cursorline highlighting?
      transparency = true, -- Use a transparent background?
      terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
      window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
    },
  }

  onedarkpro.load()
end

local enableOneDark = false
if enableOneDark then
  require("onedark").setup {
    transparent = true,
    transparent_sidebar = true,
  }
end

local vscode = true
if vscode then
  vim.g.vscode_style = "dark"
  vim.g.vscode_italic_comment = 0
  vim.g.vscode_transparent = 1
  vim.cmd [[colorscheme vscode]]
end
