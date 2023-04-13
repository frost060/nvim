require('rose-pine').setup({
	disable_background = true,
	disable_float_background = true,
    disable_italics = true,
})

require('vscode').setup({
    -- Alternatively set style in setup
    style = 'dark',

    -- Enable transparent background
    transparent = true,

    -- Enable italic comment
    italic_comments = false,

    -- Disable nvim-tree background color
    disable_nvimtree_bg = true,
})
-- require('vscode').load()

vim.cmd[[ 
    let gruvbox_italic = 1
    colorscheme gruvbox
]]

