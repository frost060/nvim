syntax enable

 "faster scrolling
set ttyfast

set termguicolors
set t_Co=256
set t_ut=
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_invert_selection=0

let g:gruvbox_baby_telescope_theme = 1
let g:gruvbox_baby_background_color="medium"

" colorscheme tokyonight

highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl

hi! link LspReferenceRead DiffChange
hi! link LspReferenceText DiffChange
hi! link LspReferenceWrite DiffChange
hi! link LspSignatureActiveParameter GruvboxOrange

hi! link TelescopeBorder GruvboxYellowBold
hi! link TelescopePromptBorder Normal
hi! link TelescopeResultsBorder FloatBorder
hi! link TelescopePreviewBorder FloatBorder

" highlight TelescopeBorder guifg=#4c4c4c
highlight TelescopeSelection guifg=#ffffff guibg=#393939 gui=bold
highlight TelescopeSelectionCaret guifg=#749484 gui=bold
