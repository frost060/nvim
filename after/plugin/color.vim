"syntax enable

 "faster scrolling
"set ttyfast

 "allow sensing the filetype
"filetype plugin on


"hi Normal guibg=NONE ctermbg=NONE
"highlight NonText ctermbg=none

"let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"highlight clear CursorLine
"highlight clear SignColumn
"highlight! link CursorLineNr Normal

hi Comment cterm=italic gui=italic
augroup TransparentBg
    """" transparent bg
    "autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
     """For Vim<8, replace EndOfBuffer by NonText
    "autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd vimenter * hi Comment cterm=italic gui=italic

    "autocmd vimenter * hi ColorColumn ctermbg=0 guibg=grey
    "autocmd vimenter * hi SignColumn guibg=none
    "autocmd vimenter * hi CursorLineNR guibg=None
    "autocmd vimenter * hi LineNr guifg=#5eacd3
    "autocmd vimenter * hi qfFileName guifg=#aed75f
augroup END

set termguicolors
set t_Co=256
set t_ut=

let colorscheme_mode = $COLORSCHEME_MODE

if colorscheme_mode == 'dark'
    set background=dark

    let g:gruvbox_italic=1
    let g:gruvbox_bold=0
    let g:gruvbox_contrast_dark = 'medium'
    let g:gruvbox_sign_column='bg0'

    let g:gruvbox_material_background='hard'
    let g:gruvbox_material_sign_column_background='none'
    let g:gruvbox_improved_warnings=0
    let g:gruvbox_improved_strings=0

    let g:everforest_background = 'hard'
    let g:everforest_better_performance = 1
    colorscheme sonokai

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
  hi StatusLine ctermfg=15 ctermbg=32 guifg=#FFFFFF guibg=#005FAF gui=bold cterm=bold
  hi SignColumn ctermfg=255 ctermbg=15 guifg=#E4E4E4 guibg=#FFFFFF

  "" Tweak popup colors
  highlight Pmenu guibg=#E4E4E4 guifg=#000000

  highlight link LspDiagnosticsFloatingError ErrorMsg
  highlight link LspDiagnosticsFloatingWarning WarningMsg
  highlight link LspDiagnosticsFloatingHint Directory
  highlight link LspDiagnosticsFloatingInformation Directory
endif

highlight TelescopeSelection gui=bold " selected item

