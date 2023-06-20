require("barometer.lsp")
require("barometer.theme")
require("barometer.set")
require("barometer.treesitter")

require("lualine").setup({
    options = {
        icons_enabled = false,
        theme = 'onedark',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    }
})

-- require("todo-comments").setup()

-- require("indent_blankline").setup({
-- 	space_char_blankline = " ",
-- 	show_current_context = false,
-- 	show_trailing_blankline_indent = false,
-- })

-- require("bufferline").setup({
-- 	options = {
-- 		separator_style = "slant",
-- 		diagnostics = "nvim_lsp",
-- 		color_icons = true,
-- 	},
-- })

-- require("mini.indentscope").setup({
-- 	options = {
-- 		-- Type of scope's border: which line(s) with smaller indent to
-- 		-- categorize as border. Can be one of: 'both', 'top', 'bottom', 'none'.
-- 		border = "both",

-- 		-- Whether to use cursor column when computing reference indent.
-- 		-- Useful to see incremental scopes with horizontal cursor movements.
-- 		indent_at_cursor = true,

-- 		-- Whether to first check input line to be a border of adjacent scope.
-- 		-- Use it if you want to place cursor on function header to get scope of
-- 		-- its body.
-- 		try_as_border = true,
-- 	},

-- 	-- Which character to use for drawing scope indicator
-- 	symbol = "│",

-- 	draw = {
-- 		delay = 100,
-- 	},
-- })
