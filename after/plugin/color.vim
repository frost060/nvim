syntax enable

 "faster scrolling
set ttyfast

set termguicolors
set t_Co=256
set t_ut=

let kitty_profile = $KITTY_COLORS

if kitty_profile == "dark"
  set background=dark

  let g:gruvbox_baby_background_color = 'dark'
  let g:gruvbox_contrast_dark = "hard"

  " colorscheme gruvbox

  highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl
  highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
  highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
  highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl
else
  set background=light
  let g:lucius_style  = 'light'
  let g:lucius_contrast  = 'high'
  let g:lucius_contrast_bg  = 'high'
  let g:lucius_no_term_bg  = 1
  colorscheme lucius

  "" Give the active window a blue background and white foreground statusline
  hi StatusLine
        \ ctermfg=15 ctermbg=32 guifg=#FFFFFF guibg=#005FAF gui=bold cterm=bold
  hi SignColumn ctermfg=255 ctermbg=15 guifg=#E4E4E4 guibg=#FFFFFF

  "" Tweak popup colors
  highlight Pmenu guibg=#E4E4E4 guifg=#000000

  highlight link LspDiagnosticsFloatingError ErrorMsg
  highlight link LspDiagnosticsFloatingWarning WarningMsg
  highlight link LspDiagnosticsFloatingHint Directory
  highlight link LspDiagnosticsFloatingInformation Directory
endif

highlight TelescopeSelection gui=bold " selected item

highlight TelescopeSelection gui=bold
