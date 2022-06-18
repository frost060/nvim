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
let g:gruvbox_contrast_dark="hard"
let g:tokyonight_transparent_background=1
let g:tokyonight_enable_italic=0
let g:tokyonight_disable_italic_comment=1
colorscheme onedark

highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl

highlight TelescopeSelection gui=bold " selected item

highlight TelescopeSelection gui=bold
