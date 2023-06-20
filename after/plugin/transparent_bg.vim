
augroup TransparentBg
    " autocmd vimenter * hi Comment cterm=italic gui=bold
    " autocmd vimenter * hi Comment guifg=#74985D
    "autocmd vimenter * hi netrwDir guifg=#5eacd3
    """"""" transparent bg
    autocmd vimenter * hi Normal guibg=#111111 ctermbg=NONE
    " autocmd vimenter * hi Normal guibg=#1e1e1e ctermbg=NONE
    """""""For Vim<8, replace EndOfBuffer by NonText
    " autocmd vimenter * hi EndOfBuffer guibg=NONE ctermbg=NONE
    " autocmd vimenter * hi EndOfBuffer guifg=#71797E ctermfg=245

    " autocmd vimenter * hi ColorColumn ctermbg=0 guibg=grey
    " autocmd vimenter * hi SignColumn guibg=none
    " autocmd vimenter * hi CursorLineNR guibg=None
    " autocmd vimenter * hi qfFileName guifg=#aed75f

    " autocmd vimenter * hi StatusLine ctermbg=0 cterm=NONE
    " autocmd vimenter * hi StatusLine ctermbg=none cterm=bold

    " autocmd vimenter * hi clear SignColumn
    " autocmd vimenter * hi clear StatusLine

    " autocmd vimenter * hi clear LineNr
    " autocmd vimenter * hi Comment guifg=#71797E
    " " autocmd vimenter * hi LineNr guifg=#5eacd3

    " autocmd vimenter * hi StatusLine guifg=#1e1e1e guibg=#D4D3D3 gui=bold
    " autocmd vimenter * hi Winbar guifg=#1e1e1e guibg=#D4D3D3 gui=bold
    " autocmd vimenter * hi Winbar guifg=#d4d3d3 guibg=None gui=bold
    " autocmd vimenter * hi MsgArea guifg=#1e1e1e guibg=#D4D3D3 gui=bold
    " autocmd vimenter * hi SignColumn guibg=none
    " autocmd vimenter * hi CursorLineNR guibg=None
    " autocmd vimenter * hi Normal guibg=none
    " autocmd vimenter * hi TelescopeNormal guifg=#2f2f2f
    " autocmd vimenter * hi clear TelescopeBorder
    " autocmd vimenter * hi TelescopeBorder guifg=#5eacd

    " autocmd vimenter * hi Pmenu guibg=NONE ctermbg=NONE
    " autocmd vimenter * hi WhichKeyFloat ctermbg=NONE guibg=NONE

    " autocmd vimenter * hi MatchParen cterm=bold ctermbg=NONE ctermfg=15 term=standout

    " autocmd vimenter * hi VertSplit cterm=NONE ctermbg=NONE

    " autocmd vimenter * hi Search ctermfg=15 cterm=NONE term=standout ctermbg=NONE
    " autocmd vimenter * hi VertSplit cterm=NONE ctermbg=Black ctermfg=Green

augroup END

" augroup VscodeTheme
"     autocmd vimenter * hi @variable guifg=#D4D3D3
"     autocmd vimenter * hi @field guifg=#D4D3D3
"     autocmd vimenter * hi @constant guifg=#D4D3D3
"     autocmd vimenter * hi @constructor guifg=#D4D3D3
"     autocmd vimenter * hi @type guifg=#D4D3D3
"     autocmd vimenter * hi @type.builtin guifg=#4EC9B0
"     autocmd vimenter * hi @attribute guifg=#4EC9B0
"     autocmd vimenter * hi @method guifg=#DCDCAA
"     autocmd vimenter * hi @keyword guifg=#C586C0
"     autocmd vimenter * hi @keyword.operator guifg=#C586C0
"     autocmd vimenter * hi @keyword.function guifg=#569cd6
"     autocmd vimenter * hi MsgArea guibg=#D4D3D3 guifg=#1e1e1e gui=bold
" augroup END


" " https://superuser.com/questions/921920/display-trailing-spaces-in-vim
" augroup HighlightTrailingWhitespace
"     autocmd vimenter * hi ExtraWhitespace ctermbg=red guibg=red
"     match ExtraWhitespace /\s\+$/
"     autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"     " autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"     autocmd InsertEnter * match ExtraWhitespace /\s\+$/
"     autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"     autocmd BufWinLeave * call clearmatches()
" augroup END

" " function! HandleMsgAreaEnter()
" "     if &buftype ==# 'messages'
" "         " Custom logic for handling the "enter" keypress in the message area
" "         echo ""
" "         hi MsgArea guibg=#D4D3D3 guifg=#1e1e1e gui=bold
" "     endif
" " endfunction

" function! RemoveStatusLine(timer)
"     set cmdheight=0
" endfunction

" function! SaveBuffer()
"     call timer_start(2000, 'RemoveStatusLine')
" endfunction

" augroup BufSaveStatusline
"     " autocmd CursorMoved * call HandleMsgAreaEnter()
"     autocmd BufWrite * call SaveBuffer()
" augroup END

