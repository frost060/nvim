colorscheme barometer

augroup TransparentBackground
  autocmd VimEnter * hi clear StatusLine
  autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
  autocmd VimEnter * hi clear LineNr
  autocmd VimEnter * hi LineNr guifg=#2d2d2d
augroup END
