"syntax enable

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on


"hi Normal guibg=NONE ctermbg=NONE
"highlight NonText ctermbg=none

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"highlight clear CursorLine
"highlight clear SignColumn
"highlight! link CursorLineNr Normal

hi Comment cterm=italic gui=italic
augroup TransparentBg
    "" transparent bg
    "autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
    " For Vim<8, replace EndOfBuffer by NonText
    "autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
    autocmd vimenter * hi Comment cterm=italic gui=italic

    "autocmd vimenter * hi ColorColumn ctermbg=0 guibg=grey
    "autocmd vimenter * hi SignColumn guibg=none
    "autocmd vimenter * hi CursorLineNR guibg=None
    "autocmd vimenter * hi LineNr guifg=#5eacd3
    "autocmd vimenter * hi qfFileName guifg=#aed75f
augroup END
