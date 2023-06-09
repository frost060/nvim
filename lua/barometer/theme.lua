require("rose-pine").setup({
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,
})
require("vscode").setup({
	-- Alternatively set style in setup
	style = "dark",
	-- Enable transparent background
	transparent = true,
	-- Enable italic comment
	italic_comments = false,
	-- Disable nvim-tree background color
	disable_nvimtree_bg = false,
})
-- require("vscode").load()
-- require("onedark").load()

require("catppuccin").setup({
	flavour = "mocha", -- latte, frappe, macchiato, mocha
	styles = {
		-- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = { "italic" },
		keywords = { "italic" },
		strings = { "italic" },
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
})

-- setup must be called before loading
vim.cmd.colorscheme("catppuccin-mocha")
