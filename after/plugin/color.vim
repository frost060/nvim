syntax enable

 "faster scrolling
set ttyfast

set termguicolors
set t_Co=256
set t_ut=
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

let g:gruvbox_italic=0
let g:gruvbox_italicize_comments=0

set background=dark
let g:gruvbox_contrast_dark="medium"
let g:tokyonight_transparent_background=1
let g:tokyonight_enable_italic=0
let g:tokyonight_disable_italic_comment=1
let g:oxocarbon_lua_transparent = 1
let g:oxocarbon_lua_alternative_telescope = 1

let g:catppuccin_flavour = "mocha" " latte, frappe, macchiato, mocha
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1

" colorscheme vscode
" colorscheme OceanicNext
" colorscheme oxocarbon-lua
" colorscheme github_dark
" colorscheme oxocarbon
" colorscheme catppuccin
" colorscheme poimandres
" colorscheme undead
" colorscheme tokyonight
colorscheme iceberg

highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl

highlight TelescopeSelection gui=bold
