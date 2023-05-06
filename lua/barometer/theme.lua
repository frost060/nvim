require("rose-pine").setup({
	disable_background = true,
	disable_float_background = true,
	disable_italics = true,
})

require("vscode").setup({
	-- Alternatively set style in setup
	style = "dark",
	-- Enable transparent background
	transparent = false,
	-- Enable italic comment
	italic_comments = false,
	-- Disable nvim-tree background color
	disable_nvimtree_bg = false,
})
require("vscode").load()
