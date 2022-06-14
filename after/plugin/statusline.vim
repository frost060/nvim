set statusline=%<\ %{mode()}\ \|\ %f%m\ \|\ %{fugitive#statusline()\ }
if has('nvim')
  set statusline+=\ \|\ %{v:lua.workspace_diagnostics_status()}
endif
set statusline+=%{&paste?'\ \ \|\ PASTE\ ':'\ '}
set statusline+=%=\ %{&fileformat}\ \|\ %{&fileencoding}\ \|\ %{&filetype}\ \|\ %l/%L\(%c\)

hi clear StatusLine
hi clear StatusLineNC
hi StatusLine   term=bold cterm=bold ctermfg=White ctermbg=235
hi StatusLineNC term=bold cterm=bold ctermfg=White ctermbg=235

