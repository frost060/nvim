augroup TransparentBg
    "autocmd vimenter * hi netrwDir guifg=#5eacd3
    "autocmd vimenter * hi TelescopeBorder guifg=#5eacd
    """"""" transparent bg
    "autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
     """""""For Vim<8, replace EndOfBuffer by NonText
    "autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE

    "autocmd vimenter * hi ColorColumn ctermbg=0 guibg=grey
    "autocmd vimenter * hi SignColumn guibg=none
    "autocmd vimenter * hi CursorLineNR guibg=None
    "autocmd vimenter * hi qfFileName guifg=#aed75f

    """autocmd vimenter * hi StatusLine ctermbg=0 cterm=NONE
    """autocmd vimenter * hi StatusLine ctermbg=none cterm=bold
    """autocmd vimenter * hi clear StatusLine

    ""autocmd vimenter * hi clear SignColumn                " SignColumn should match background

    "autocmd vimenter * hi clear LineNr
    "autocmd vimenter * hi LineNr guifg=#5eacd3

    "autocmd vimenter * hi MatchParen cterm=bold ctermbg=NONE ctermfg=15 term=standout

    "autocmd vimenter * hi clear CursorLine
    "autocmd vimenter * hi CursorLineNR cterm=bold ctermfg=226

    "autocmd vimenter * hi VertSplit cterm=NONE ctermbg=NONE

    "autocmd vimenter * hi IncSearch ctermfg=15 cterm=bold,underline term=standout
    "autocmd vimenter * hi Search ctermfg=15 cterm=NONE term=standout ctermbg=NONE
augroup END
