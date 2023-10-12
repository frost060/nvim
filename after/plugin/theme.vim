augroup Transparent " transparent background
    autocmd vimenter * hi clear TelescopeNormal
    autocmd vimenter * hi clear TelescopeBorder
    autocmd vimenter * hi clear TelescopePromptNormal
    autocmd vimenter * hi clear TelescopePromptBorder
    autocmd vimenter * hi clear StatusLine
    autocmd vimenter hi CursorLine guibg=None
    autocmd BufEnter hi CursorLine guibg=Nonethe
augroup END
