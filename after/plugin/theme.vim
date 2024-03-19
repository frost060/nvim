let g:gruvbox_contrast_dark = "hard"
colorscheme quiet
" PhoenixYellow

highlight DiagnosticUnderlineError cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineWarn cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineInfo cterm=undercurl gui=undercurl
highlight DiagnosticUnderlineHint cterm=undercurl gui=undercurl

hi! link LspReferenceRead DiffChange
hi! link LspReferenceText DiffChange
hi! link LspReferenceWrite DiffChange
hi! link LspSignatureActiveParameter GruvboxOrange

" hi! link TelescopeBorder GruvboxYellowBold
" hi! link TelescopePromptBorder Normal
" hi! link TelescopeResultsBorder FloatBorder
" hi! link TelescopePreviewBorder FloatBorder

augroup TransparentBackground
  autocmd VimEnter * hi clear StatusLine
  " autocmd VimEnter * hi clear LineNr
augroup END
