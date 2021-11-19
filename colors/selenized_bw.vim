" Name:         Selenized black/white, beta version
" Author:       Jan Warchoł <jan.warchol@gmail.com>
" Maintainer:   Jan Warchoł <jan.warchol@gmail.com>
" License:      Vim License (see `:help license`)
" Last Updated: Sat 25 Apr 2020 17:38:38

" Generated by Colortemplate v2.0.0

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'selenized_bw'

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2
let s:italics = (&t_ZH != '' && &t_ZH != '[7m') || has('gui_running') || has('nvim')

if (has('termguicolors') && &termguicolors) || has('gui_running')
  if &background ==# 'dark'
    let g:terminal_ansi_colors = ['#252525', '#ed4a46', '#70b433', '#dbb32d',
          \ '#368aeb', '#eb6eb7', '#3fc5b7', '#777777', '3b3b3b', '#ff5e56',
          \ '#83c746', '#efc541', '#4f9cfe', '#ff81ca', '#56d8c9', '#dedede']
    if has('nvim')
      let g:terminal_color_0 = '#252525'
      let g:terminal_color_1 = '#ed4a46'
      let g:terminal_color_2 = '#70b433'
      let g:terminal_color_3 = '#dbb32d'
      let g:terminal_color_4 = '#368aeb'
      let g:terminal_color_5 = '#eb6eb7'
      let g:terminal_color_6 = '#3fc5b7'
      let g:terminal_color_7 = '#777777'
      let g:terminal_color_8 = '#3b3b3b'
      let g:terminal_color_9 = '#ff5e56'
      let g:terminal_color_10 = '#83c746'
      let g:terminal_color_11 = '#efc541'
      let g:terminal_color_12 = '#4f9cfe'
      let g:terminal_color_13 = '#ff81ca'
      let g:terminal_color_14 = '#56d8c9'
      let g:terminal_color_15 = '#dedede'
    endif
    hi Normal guifg=#b9b9b9 guibg=#181818 guisp=NONE gui=NONE cterm=NONE
    hi IncSearch guifg=#e67f43 guibg=NONE guisp=NONE gui=reverse cterm=reverse
    hi Search guifg=#dbb32d guibg=NONE guisp=NONE gui=reverse cterm=reverse
    hi! link QuickFixLine Search
    hi Visual guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
    hi MatchParen guifg=#efc541 guibg=#3b3b3b guisp=NONE gui=bold cterm=bold
    hi Cursor guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
    hi! link lCursor Cursor
    hi CursorLine guifg=NONE guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi CursorColumn guifg=NONE guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi Folded guifg=NONE guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi ColorColumn guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
    hi LineNr guifg=#777777 guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi CursorLineNr guifg=#dedede guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi VertSplit guifg=#777777 guibg=#777777 guisp=NONE gui=NONE cterm=NONE
    hi StatusLine guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
    hi StatusLineNC guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
    hi! link StatusLineTerm StatusLine
    hi! link StatusLineTermNC StatusLineNC
    hi TabLineSel guifg=#dedede guibg=#252525 guisp=NONE gui=bold,reverse cterm=bold,reverse
    hi TabLine guifg=#777777 guibg=NONE guisp=NONE gui=reverse cterm=reverse
    hi TabLineFill guifg=#777777 guibg=NONE guisp=NONE gui=reverse cterm=reverse
    hi ToolbarButton guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
    hi ToolbarLine guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
    hi Pmenu guifg=#777777 guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi PmenuSel guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
    hi PmenuThumb guifg=NONE guibg=#777777 guisp=NONE gui=NONE cterm=NONE
    hi PmenuSbar guifg=NONE guibg=#3b3b3b guisp=NONE gui=NONE cterm=NONE
    hi DiffAdd guifg=#70b433 guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi DiffChange guifg=NONE guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi DiffDelete guifg=#ed4a46 guibg=#252525 guisp=NONE gui=NONE cterm=NONE
    hi DiffText guifg=#252525 guibg=#dbb32d guisp=NONE gui=NONE cterm=NONE
    hi Comment guifg=#777777 guibg=NONE guisp=NONE gui=italic cterm=italic
    hi Constant guifg=#3fc5b7 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi! link String Constant
    hi! link Number Constant
    hi! link Boolean Constant
    hi! link Character Constant
    hi! link Float Constant
    hi Identifier guifg=#4f9cfe guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi! link Function Identifier
    hi Statement guifg=#efc541 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi! link Conditional Statement
    hi! link Repeat Statement
    hi! link Keyword Statement
    hi! link Label Statement
    hi! link Exception Statement
    hi! link Operator Statement
    hi PreProc guifg=#e67f43 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi! link Define PreProc
    hi! link PreCondit PreProc
    hi! link Include PreProc
    hi! link Macro Include
    hi Type guifg=#70b433 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi! link Typedef Type
    hi! link StorageClass Type
    hi! link Structure Type
    hi Special guifg=#ed4a46 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi! link SpecialChar Special
    hi! link Delimiter Special
    hi! link SpecialComment Special
    hi! link Debug Special
    hi! link Tag Special
    hi Error guifg=#ed4a46 guibg=NONE guisp=NONE gui=bold cterm=bold
    hi Todo guifg=#eb6eb7 guibg=NONE guisp=NONE gui=bold cterm=bold
    hi Underlined guifg=#a580e2 guibg=NONE guisp=NONE gui=underline cterm=underline
    hi Ignore guifg=#3b3b3b guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi VimCommand guifg=#dbb32d guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi RubyDefine guifg=#dedede guibg=NONE guisp=NONE gui=bold cterm=bold
    if !s:italics
      hi Comment gui=NONE cterm=NONE
    endif
    if get(g:, 'selenized_green_keywords', 0)
      hi Statement guifg=#70b433 guibg=NONE guisp=NONE gui=NONE cterm=NONE
      hi Type guifg=#dbb32d guibg=NONE guisp=NONE gui=NONE cterm=NONE
    endif
    hi Terminal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Conceal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Directory guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi EndOfBuffer guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ErrorMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi FoldColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ModeMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi MoreMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi NonText guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Question guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SignColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SpecialKey guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SpellBad guifg=NONE guibg=NONE guisp=#ed4a46 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
    hi SpellCap guifg=NONE guibg=NONE guisp=#ed4a46 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
    hi SpellLocal guifg=NONE guibg=NONE guisp=#dbb32d gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
    hi SpellRare guifg=NONE guibg=NONE guisp=#3fc5b7 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
    hi Title guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi VisualNOS guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WarningMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WildMenu guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  let g:terminal_ansi_colors = ['#ebebeb', '#d6000c', '#1d9700', '#c49700',
        \ '#0064e4', '#dd0f9d', '#00ad9c', '#878787', '#cdcdcd', '#bf0000',
        \ '#008400', '#af8500', '#0054cf', '#c7008b', '#009a8a', '#282828']
  if has('nvim')
    let g:terminal_color_0 = '#ebebeb'
    let g:terminal_color_1 = '#d6000c'
    let g:terminal_color_2 = '#1d9700'
    let g:terminal_color_3 = '#c49700'
    let g:terminal_color_4 = '#0064e4'
    let g:terminal_color_5 = '#dd0f9d'
    let g:terminal_color_6 = '#00ad9c'
    let g:terminal_color_7 = '#878787'
    let g:terminal_color_8 = '#cdcdcd'
    let g:terminal_color_9 = '#bf0000'
    let g:terminal_color_10 = '#008400'
    let g:terminal_color_11 = '#af8500'
    let g:terminal_color_12 = '#0054cf'
    let g:terminal_color_13 = '#c7008b'
    let g:terminal_color_14 = '#009a8a'
    let g:terminal_color_15 = '#282828'
  endif
  hi Normal guifg=#474747 guibg=#ffffff guisp=NONE gui=NONE cterm=NONE
  hi IncSearch guifg=#d04a00 guibg=NONE guisp=NONE gui=reverse cterm=reverse
  hi Search guifg=#c49700 guibg=NONE guisp=NONE gui=reverse cterm=reverse
  hi! link QuickFixLine Search
  hi Visual guifg=NONE guibg=#cdcdcd guisp=NONE gui=NONE cterm=NONE
  hi MatchParen guifg=#af8500 guibg=#cdcdcd guisp=NONE gui=bold cterm=bold
  hi Cursor guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
  hi! link lCursor Cursor
  hi CursorLine guifg=NONE guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi CursorColumn guifg=NONE guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi Folded guifg=NONE guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi ColorColumn guifg=NONE guibg=#cdcdcd guisp=NONE gui=NONE cterm=NONE
  hi LineNr guifg=#878787 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi CursorLineNr guifg=#282828 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi VertSplit guifg=#878787 guibg=#878787 guisp=NONE gui=NONE cterm=NONE
  hi StatusLine guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
  hi StatusLineNC guifg=NONE guibg=#cdcdcd guisp=NONE gui=NONE cterm=NONE
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi TabLineSel guifg=#282828 guibg=#ebebeb guisp=NONE gui=bold,reverse cterm=bold,reverse
  hi TabLine guifg=#878787 guibg=NONE guisp=NONE gui=reverse cterm=reverse
  hi TabLineFill guifg=#878787 guibg=NONE guisp=NONE gui=reverse cterm=reverse
  hi ToolbarButton guifg=NONE guibg=NONE guisp=NONE gui=reverse ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ToolbarLine guifg=NONE guibg=#cdcdcd guisp=NONE gui=NONE cterm=NONE
  hi Pmenu guifg=#878787 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi PmenuSel guifg=NONE guibg=#cdcdcd guisp=NONE gui=NONE cterm=NONE
  hi PmenuThumb guifg=NONE guibg=#878787 guisp=NONE gui=NONE cterm=NONE
  hi PmenuSbar guifg=NONE guibg=#cdcdcd guisp=NONE gui=NONE cterm=NONE
  hi DiffAdd guifg=#1d9700 guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi DiffChange guifg=NONE guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi DiffDelete guifg=#d6000c guibg=#ebebeb guisp=NONE gui=NONE cterm=NONE
  hi DiffText guifg=#ebebeb guibg=#c49700 guisp=NONE gui=NONE cterm=NONE
  hi Comment guifg=#878787 guibg=NONE guisp=NONE gui=italic cterm=italic
  hi Constant guifg=#00ad9c guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi! link String Constant
  hi! link Number Constant
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi Identifier guifg=#0054cf guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi! link Function Identifier
  hi Statement guifg=#af8500 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi! link Conditional Statement
  hi! link Repeat Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Exception Statement
  hi! link Operator Statement
  hi PreProc guifg=#d04a00 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi! link Define PreProc
  hi! link PreCondit PreProc
  hi! link Include PreProc
  hi! link Macro Include
  hi Type guifg=#1d9700 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi! link Typedef Type
  hi! link StorageClass Type
  hi! link Structure Type
  hi Special guifg=#d6000c guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi! link SpecialChar Special
  hi! link Delimiter Special
  hi! link SpecialComment Special
  hi! link Debug Special
  hi! link Tag Special
  hi Error guifg=#d6000c guibg=NONE guisp=NONE gui=bold cterm=bold
  hi Todo guifg=#dd0f9d guibg=NONE guisp=NONE gui=bold cterm=bold
  hi Underlined guifg=#7f51d6 guibg=NONE guisp=NONE gui=underline cterm=underline
  hi Ignore guifg=#cdcdcd guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi VimCommand guifg=#c49700 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  hi RubyDefine guifg=#282828 guibg=NONE guisp=NONE gui=bold cterm=bold
  if !s:italics
    hi Comment gui=NONE cterm=NONE
  endif
  if get(g:, 'selenized_green_keywords', 0)
    hi Statement guifg=#1d9700 guibg=NONE guisp=NONE gui=NONE cterm=NONE
    hi Type guifg=#c49700 guibg=NONE guisp=NONE gui=NONE cterm=NONE
  endif
  hi Terminal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Conceal guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Directory guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi EndOfBuffer guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ErrorMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi FoldColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ModeMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi MoreMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi NonText guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Question guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SignColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpecialKey guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellBad guifg=NONE guibg=NONE guisp=#d6000c gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellCap guifg=NONE guibg=NONE guisp=#d6000c gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellLocal guifg=NONE guibg=NONE guisp=#c49700 gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi SpellRare guifg=NONE guibg=NONE guisp=#00ad9c gui=undercurl ctermfg=NONE ctermbg=NONE cterm=undercurl
  hi Title guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VisualNOS guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WarningMsg guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WildMenu guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 256
  if &background ==# 'dark'
    hi Normal ctermfg=250 ctermbg=234 cterm=NONE
    if !has('patch-8.0.0616') && !has('nvim') " Fix for Vim bug
      set background=dark
    endif
    hi IncSearch ctermfg=173 ctermbg=NONE cterm=reverse
    hi Search ctermfg=178 ctermbg=NONE cterm=reverse
    hi! link QuickFixLine Search
    hi Visual ctermfg=NONE ctermbg=237 cterm=NONE
    hi MatchParen ctermfg=178 ctermbg=237 cterm=bold
    hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
    hi! link lCursor Cursor
    hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=235 cterm=NONE
    hi Folded ctermfg=NONE ctermbg=235 cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=237 cterm=NONE
    hi LineNr ctermfg=243 ctermbg=235 cterm=NONE
    hi CursorLineNr ctermfg=253 ctermbg=NONE cterm=NONE
    hi VertSplit ctermfg=243 ctermbg=243 cterm=NONE
    hi StatusLine ctermfg=NONE ctermbg=NONE cterm=reverse
    hi StatusLineNC ctermfg=NONE ctermbg=237 cterm=NONE
    hi! link StatusLineTerm StatusLine
    hi! link StatusLineTermNC StatusLineNC
    hi TabLineSel ctermfg=253 ctermbg=235 cterm=bold,reverse
    hi TabLine ctermfg=243 ctermbg=NONE cterm=reverse
    hi TabLineFill ctermfg=243 ctermbg=NONE cterm=reverse
    hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=reverse
    hi ToolbarLine ctermfg=NONE ctermbg=237 cterm=NONE
    hi Pmenu ctermfg=243 ctermbg=235 cterm=NONE
    hi PmenuSel ctermfg=NONE ctermbg=237 cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=243 cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=237 cterm=NONE
    hi DiffAdd ctermfg=70 ctermbg=235 cterm=NONE
    hi DiffChange ctermfg=NONE ctermbg=235 cterm=NONE
    hi DiffDelete ctermfg=203 ctermbg=235 cterm=NONE
    hi DiffText ctermfg=235 ctermbg=178 cterm=NONE
    hi Comment ctermfg=243 ctermbg=NONE cterm=italic
    hi Constant ctermfg=44 ctermbg=NONE cterm=NONE
    hi! link String Constant
    hi! link Number Constant
    hi! link Boolean Constant
    hi! link Character Constant
    hi! link Float Constant
    hi Identifier ctermfg=39 ctermbg=NONE cterm=NONE
    hi! link Function Identifier
    hi Statement ctermfg=178 ctermbg=NONE cterm=NONE
    hi! link Conditional Statement
    hi! link Repeat Statement
    hi! link Keyword Statement
    hi! link Label Statement
    hi! link Exception Statement
    hi! link Operator Statement
    hi PreProc ctermfg=173 ctermbg=NONE cterm=NONE
    hi! link Define PreProc
    hi! link PreCondit PreProc
    hi! link Include PreProc
    hi! link Macro Include
    hi Type ctermfg=70 ctermbg=NONE cterm=NONE
    hi! link Typedef Type
    hi! link StorageClass Type
    hi! link Structure Type
    hi Special ctermfg=203 ctermbg=NONE cterm=NONE
    hi! link SpecialChar Special
    hi! link Delimiter Special
    hi! link SpecialComment Special
    hi! link Debug Special
    hi! link Tag Special
    hi Error ctermfg=203 ctermbg=NONE cterm=bold
    hi Todo ctermfg=205 ctermbg=NONE cterm=bold
    hi Underlined ctermfg=140 ctermbg=NONE cterm=underline
    hi Ignore ctermfg=237 ctermbg=NONE cterm=NONE
    hi VimCommand ctermfg=178 ctermbg=NONE cterm=NONE
    hi RubyDefine ctermfg=253 ctermbg=NONE cterm=bold
    if !s:italics
      hi Comment cterm=NONE
    endif
    if get(g:, 'selenized_green_keywords', 0)
      hi Statement ctermfg=70 ctermbg=NONE cterm=NONE
      hi Type ctermfg=178 ctermbg=NONE cterm=NONE
    endif
    hi Terminal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=NONE ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
    hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  hi Normal ctermfg=238 ctermbg=231 cterm=NONE
  hi IncSearch ctermfg=166 ctermbg=NONE cterm=reverse
  hi Search ctermfg=136 ctermbg=NONE cterm=reverse
  hi! link QuickFixLine Search
  hi Visual ctermfg=NONE ctermbg=252 cterm=NONE
  hi MatchParen ctermfg=136 ctermbg=252 cterm=bold
  hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
  hi! link lCursor Cursor
  hi CursorLine ctermfg=NONE ctermbg=255 cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=255 cterm=NONE
  hi Folded ctermfg=NONE ctermbg=255 cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=252 cterm=NONE
  hi LineNr ctermfg=102 ctermbg=255 cterm=NONE
  hi CursorLineNr ctermfg=235 ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=102 ctermbg=102 cterm=NONE
  hi StatusLine ctermfg=NONE ctermbg=NONE cterm=reverse
  hi StatusLineNC ctermfg=NONE ctermbg=252 cterm=NONE
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi TabLineSel ctermfg=235 ctermbg=255 cterm=bold,reverse
  hi TabLine ctermfg=102 ctermbg=NONE cterm=reverse
  hi TabLineFill ctermfg=102 ctermbg=NONE cterm=reverse
  hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ToolbarLine ctermfg=NONE ctermbg=252 cterm=NONE
  hi Pmenu ctermfg=102 ctermbg=255 cterm=NONE
  hi PmenuSel ctermfg=NONE ctermbg=252 cterm=NONE
  hi PmenuThumb ctermfg=NONE ctermbg=102 cterm=NONE
  hi PmenuSbar ctermfg=NONE ctermbg=252 cterm=NONE
  hi DiffAdd ctermfg=28 ctermbg=255 cterm=NONE
  hi DiffChange ctermfg=NONE ctermbg=255 cterm=NONE
  hi DiffDelete ctermfg=160 ctermbg=255 cterm=NONE
  hi DiffText ctermfg=255 ctermbg=136 cterm=NONE
  hi Comment ctermfg=102 ctermbg=NONE cterm=italic
  hi Constant ctermfg=37 ctermbg=NONE cterm=NONE
  hi! link String Constant
  hi! link Number Constant
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi Identifier ctermfg=26 ctermbg=NONE cterm=NONE
  hi! link Function Identifier
  hi Statement ctermfg=136 ctermbg=NONE cterm=NONE
  hi! link Conditional Statement
  hi! link Repeat Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Exception Statement
  hi! link Operator Statement
  hi PreProc ctermfg=166 ctermbg=NONE cterm=NONE
  hi! link Define PreProc
  hi! link PreCondit PreProc
  hi! link Include PreProc
  hi! link Macro Include
  hi Type ctermfg=28 ctermbg=NONE cterm=NONE
  hi! link Typedef Type
  hi! link StorageClass Type
  hi! link Structure Type
  hi Special ctermfg=160 ctermbg=NONE cterm=NONE
  hi! link SpecialChar Special
  hi! link Delimiter Special
  hi! link SpecialComment Special
  hi! link Debug Special
  hi! link Tag Special
  hi Error ctermfg=160 ctermbg=NONE cterm=bold
  hi Todo ctermfg=163 ctermbg=NONE cterm=bold
  hi Underlined ctermfg=98 ctermbg=NONE cterm=underline
  hi Ignore ctermfg=252 ctermbg=NONE cterm=NONE
  hi VimCommand ctermfg=136 ctermbg=NONE cterm=NONE
  hi RubyDefine ctermfg=235 ctermbg=NONE cterm=bold
  if !s:italics
    hi Comment cterm=NONE
  endif
  if get(g:, 'selenized_green_keywords', 0)
    hi Statement ctermfg=28 ctermbg=NONE cterm=NONE
    hi Type ctermfg=136 ctermbg=NONE cterm=NONE
  endif
  hi Terminal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
  unlet s:t_Co s:italics
  finish
endif

if s:t_Co >= 16
  if &background ==# 'dark'
    hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi IncSearch ctermfg=DarkMagenta ctermbg=NONE cterm=reverse
    hi Search ctermfg=DarkYellow ctermbg=NONE cterm=reverse
    hi! link QuickFixLine Search
    hi Visual ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi MatchParen ctermfg=LightYellow ctermbg=DarkGrey cterm=bold
    hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
    hi! link lCursor Cursor
    hi CursorLine ctermfg=NONE ctermbg=Black cterm=NONE
    hi CursorColumn ctermfg=NONE ctermbg=Black cterm=NONE
    hi Folded ctermfg=NONE ctermbg=Black cterm=NONE
    hi ColorColumn ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi LineNr ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi CursorLineNr ctermfg=White ctermbg=NONE cterm=NONE
    hi VertSplit ctermfg=LightGrey ctermbg=LightGrey cterm=NONE
    hi StatusLine ctermfg=NONE ctermbg=NONE cterm=reverse
    hi StatusLineNC ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi! link StatusLineTerm StatusLine
    hi! link StatusLineTermNC StatusLineNC
    hi TabLineSel ctermfg=White ctermbg=Black cterm=bold,reverse
    hi TabLine ctermfg=LightGrey ctermbg=NONE cterm=reverse
    hi TabLineFill ctermfg=LightGrey ctermbg=NONE cterm=reverse
    hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=reverse
    hi ToolbarLine ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi Pmenu ctermfg=LightGrey ctermbg=Black cterm=NONE
    hi PmenuSel ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi PmenuThumb ctermfg=NONE ctermbg=LightGrey cterm=NONE
    hi PmenuSbar ctermfg=NONE ctermbg=DarkGrey cterm=NONE
    hi DiffAdd ctermfg=DarkGreen ctermbg=Black cterm=NONE
    hi DiffChange ctermfg=NONE ctermbg=Black cterm=NONE
    hi DiffDelete ctermfg=DarkRed ctermbg=Black cterm=NONE
    hi DiffText ctermfg=Black ctermbg=DarkYellow cterm=NONE
    hi Comment ctermfg=LightGrey ctermbg=NONE cterm=italic
    hi Constant ctermfg=DarkCyan ctermbg=NONE cterm=NONE
    hi! link String Constant
    hi! link Number Constant
    hi! link Boolean Constant
    hi! link Character Constant
    hi! link Float Constant
    hi Identifier ctermfg=LightBlue ctermbg=NONE cterm=NONE
    hi! link Function Identifier
    hi Statement ctermfg=LightYellow ctermbg=NONE cterm=NONE
    hi! link Conditional Statement
    hi! link Repeat Statement
    hi! link Keyword Statement
    hi! link Label Statement
    hi! link Exception Statement
    hi! link Operator Statement
    hi PreProc ctermfg=DarkMagenta ctermbg=NONE cterm=NONE
    hi! link Define PreProc
    hi! link PreCondit PreProc
    hi! link Include PreProc
    hi! link Macro Include
    hi Type ctermfg=DarkGreen ctermbg=NONE cterm=NONE
    hi! link Typedef Type
    hi! link StorageClass Type
    hi! link Structure Type
    hi Special ctermfg=DarkRed ctermbg=NONE cterm=NONE
    hi! link SpecialChar Special
    hi! link Delimiter Special
    hi! link SpecialComment Special
    hi! link Debug Special
    hi! link Tag Special
    hi Error ctermfg=DarkRed ctermbg=NONE cterm=bold
    hi Todo ctermfg=DarkMagenta ctermbg=NONE cterm=bold
    hi Underlined ctermfg=LightBlue ctermbg=NONE cterm=underline
    hi Ignore ctermfg=DarkGrey ctermbg=NONE cterm=NONE
    hi VimCommand ctermfg=DarkYellow ctermbg=NONE cterm=NONE
    hi RubyDefine ctermfg=White ctermbg=NONE cterm=bold
    if !s:italics
      hi Comment cterm=NONE
    endif
    if get(g:, 'selenized_green_keywords', 0)
      hi Statement ctermfg=DarkGreen ctermbg=NONE cterm=NONE
      hi Type ctermfg=DarkYellow ctermbg=NONE cterm=NONE
    endif
    hi Terminal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE
    hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE
    hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SpecialKey ctermfg=NONE ctermbg=NONE cterm=NONE
    hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
    hi SpellCap ctermfg=NONE ctermbg=NONE cterm=underline
    hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline
    hi SpellRare ctermfg=NONE ctermbg=NONE cterm=underline
    hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
    hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE
    hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
    unlet s:t_Co s:italics
    finish
  endif
  " Light background
  hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi IncSearch ctermfg=DarkMagenta ctermbg=NONE cterm=reverse
  hi Search ctermfg=DarkYellow ctermbg=NONE cterm=reverse
  hi! link QuickFixLine Search
  hi Visual ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi MatchParen ctermfg=LightYellow ctermbg=DarkGrey cterm=bold
  hi Cursor ctermfg=NONE ctermbg=NONE cterm=reverse
  hi! link lCursor Cursor
  hi CursorLine ctermfg=NONE ctermbg=Black cterm=NONE
  hi CursorColumn ctermfg=NONE ctermbg=Black cterm=NONE
  hi Folded ctermfg=NONE ctermbg=Black cterm=NONE
  hi ColorColumn ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi LineNr ctermfg=LightGrey ctermbg=Black cterm=NONE
  hi CursorLineNr ctermfg=White ctermbg=NONE cterm=NONE
  hi VertSplit ctermfg=LightGrey ctermbg=LightGrey cterm=NONE
  hi StatusLine ctermfg=NONE ctermbg=NONE cterm=reverse
  hi StatusLineNC ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi! link StatusLineTerm StatusLine
  hi! link StatusLineTermNC StatusLineNC
  hi TabLineSel ctermfg=White ctermbg=Black cterm=bold,reverse
  hi TabLine ctermfg=LightGrey ctermbg=NONE cterm=reverse
  hi TabLineFill ctermfg=LightGrey ctermbg=NONE cterm=reverse
  hi ToolbarButton ctermfg=NONE ctermbg=NONE cterm=reverse
  hi ToolbarLine ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi Pmenu ctermfg=LightGrey ctermbg=Black cterm=NONE
  hi PmenuSel ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi PmenuThumb ctermfg=NONE ctermbg=LightGrey cterm=NONE
  hi PmenuSbar ctermfg=NONE ctermbg=DarkGrey cterm=NONE
  hi DiffAdd ctermfg=DarkGreen ctermbg=Black cterm=NONE
  hi DiffChange ctermfg=NONE ctermbg=Black cterm=NONE
  hi DiffDelete ctermfg=DarkRed ctermbg=Black cterm=NONE
  hi DiffText ctermfg=Black ctermbg=DarkYellow cterm=NONE
  hi Comment ctermfg=LightGrey ctermbg=NONE cterm=italic
  hi Constant ctermfg=DarkCyan ctermbg=NONE cterm=NONE
  hi! link String Constant
  hi! link Number Constant
  hi! link Boolean Constant
  hi! link Character Constant
  hi! link Float Constant
  hi Identifier ctermfg=LightBlue ctermbg=NONE cterm=NONE
  hi! link Function Identifier
  hi Statement ctermfg=LightYellow ctermbg=NONE cterm=NONE
  hi! link Conditional Statement
  hi! link Repeat Statement
  hi! link Keyword Statement
  hi! link Label Statement
  hi! link Exception Statement
  hi! link Operator Statement
  hi PreProc ctermfg=DarkMagenta ctermbg=NONE cterm=NONE
  hi! link Define PreProc
  hi! link PreCondit PreProc
  hi! link Include PreProc
  hi! link Macro Include
  hi Type ctermfg=DarkGreen ctermbg=NONE cterm=NONE
  hi! link Typedef Type
  hi! link StorageClass Type
  hi! link Structure Type
  hi Special ctermfg=DarkRed ctermbg=NONE cterm=NONE
  hi! link SpecialChar Special
  hi! link Delimiter Special
  hi! link SpecialComment Special
  hi! link Debug Special
  hi! link Tag Special
  hi Error ctermfg=DarkRed ctermbg=NONE cterm=bold
  hi Todo ctermfg=DarkMagenta ctermbg=NONE cterm=bold
  hi Underlined ctermfg=LightBlue ctermbg=NONE cterm=underline
  hi Ignore ctermfg=DarkGrey ctermbg=NONE cterm=NONE
  hi VimCommand ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  hi RubyDefine ctermfg=White ctermbg=NONE cterm=bold
  if !s:italics
    hi Comment cterm=NONE
  endif
  if get(g:, 'selenized_green_keywords', 0)
    hi Statement ctermfg=DarkGreen ctermbg=NONE cterm=NONE
    hi Type ctermfg=DarkYellow ctermbg=NONE cterm=NONE
  endif
  hi Terminal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Conceal ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE
  hi EndOfBuffer ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE
  hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpecialKey ctermfg=NONE ctermbg=NONE cterm=NONE
  hi SpellBad ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellCap ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=underline
  hi SpellRare ctermfg=NONE ctermbg=NONE cterm=underline
  hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
  hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE
  hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
  unlet s:t_Co s:italics
  finish
endif

" Background: dark
" Color: bg_0          #181818        ~        none
" Color: bg_1          #252525        ~        Black
" Color: bg_2          #3b3b3b        ~        DarkGrey
" Color: dim_0         #777777        ~        LightGrey
" Color: fg_0          #b9b9b9        ~        none
" Color: fg_1          #dedede        ~        White
" Color: red           #ed4a46      203        DarkRed
" Color: green         #70b433        ~        DarkGreen
" Color: yellow        #dbb32d        ~        DarkYellow
" Color: blue          #368aeb       33        DarkBlue
" Color: magenta       #eb6eb7        ~        DarkMagenta
" Color: cyan          #3fc5b7        ~        DarkCyan
" Color: br_red        #ff5e56        ~        LightRed
" Color: br_green      #83c746        ~        LightGreen
" Color: br_yellow     #efc541      178        LightYellow
" Color: br_blue       #4f9cfe       39        LightBlue
" Color: br_magenta    #ff81ca        ~        LightMagenta
" Color: br_cyan       #56d8c9        ~        LightCyan
" Color: orange        #e67f43        ~        DarkMagenta
" Color: violet        #a580e2        ~        LightBlue
" Color: br_orange     #fa9153        ~        LightMagenta
" Color: br_violet     #b891f5        ~        LightBlue
" Term colors: bg_1 red    green    yellow    blue    magenta    cyan    dim_0
" Term colors: bg_2 br_red br_green br_yellow br_blue br_magenta br_cyan fg_1
" Background: light
" Color: bg_0          #ffffff        ~        none
" Color: bg_1          #ebebeb        ~        Black
" Color: bg_2          #cdcdcd        ~        DarkGrey
" Color: dim_0         #878787        ~        LightGrey
" Color: fg_0          #474747        ~        none
" Color: fg_1          #282828        ~        White
" Color: red           #d6000c        ~        DarkRed
" Color: green         #1d9700        ~        DarkGreen
" Color: yellow        #c49700        ~        DarkYellow
" Color: blue          #0064e4        ~        DarkBlue
" Color: magenta       #dd0f9d        ~        DarkMagenta
" Color: cyan          #00ad9c        ~        DarkCyan
" Color: br_red        #bf0000        ~        LightRed
" Color: br_green      #008400        ~        LightGreen
" Color: br_yellow     #af8500        ~        LightYellow
" Color: br_blue       #0054cf        ~        LightBlue
" Color: br_magenta    #c7008b        ~        LightMagenta
" Color: br_cyan       #009a8a        ~        LightCyan
" Color: orange        #d04a00        ~        DarkMagenta
" Color: violet        #7f51d6        ~        LightBlue
" Color: br_orange     #ba3700        ~        LightMagenta
" Color: br_violet     #6b40c3        ~        LightBlue
" Term colors: bg_1 red    green    yellow    blue    magenta    cyan    dim_0
" Term colors: bg_2 br_red br_green br_yellow br_blue br_magenta br_cyan fg_1
" vim: et ts=2 sw=2#
