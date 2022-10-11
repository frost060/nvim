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

colorscheme gruvbox

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
