" set statusline=%<\ %{mode()}\ \|\ %f%m\ \|\ %{fugitive#statusline()\ }
" if has('nvim')
"   set statusline+=\ \|\ %{v:lua.workspace_diagnostics_status()}
" endif
" set statusline+=%{&paste?'\ \ \|\ PASTE\ ':'\ '}
" set statusline+=%=\ %{&fileformat}\ \|\ %{&fileencoding}\ \|\ %{&filetype}\ \|\ %l/%L\(%c\)
