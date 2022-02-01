local nebulous = false
if nebulous then
  require("nebulous").setup {
    variant = "fullmoon",
    disable = {
      background = false,
      endOfBuffer = false,
      terminal_colors = true,
    },
    italic = {
      comments = true,
      keywords = true,
      functions = true,
      variables = true,
    },
    custom_colors = { -- this table can hold any group of colors with their respective values
      --LineNr = { fg = "#5BBBDA", bg = "NONE", style = "NONE" },
      CursorLineNr = { fg = "#E1CD6C", bg = "NONE", style = "NONE" },

      -- it is possible to specify only the element to be changed
      TelescopePreviewBorder = { fg = "#A13413" },
      LspDiagnosticsDefaultError = { bg = "#E11313" },
      TSTagDelimiter = { style = "bold,italic" },
    },
  }
end

local gruvbuddy = true
if gruvbuddy then
  require("colorbuddy").colorscheme "gruvbuddy"
  vim.cmd [[ highlight ColorColumn guibg=#2E3440 ]]
end

local catppuccin = false
if catppuccin then
  require("catppuccin").setup {}
  vim.cmd [[colorscheme catppuccin]]
end

local tokyonight = false
if tokyonight then
  vim.g.tokyonight_style = "storm"
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }
  vim.cmd [[ colorscheme tokyonight ]]
end
