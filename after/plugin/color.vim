syntax enable

 "faster scrolling
set ttyfast

set termguicolors
set t_Co=256
set t_ut=

let g:gruvbox_baby_background_color = 'dark'
let g:gruvbox_contrast_dark = "hard"

colorscheme gruvbox

highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl

highlight TelescopeSelection gui=bold
