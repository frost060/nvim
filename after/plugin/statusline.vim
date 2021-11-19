"Status Line
"set statusline=
"set statusline+=%#NonText#
"set statusline+=%=
"set statusline+=\ %f
"" Name of the current branch (needs fugitive.vim)
"set statusline +=\ %{fugitive#statusline()}
"" Date of the last time the file was saved
"set statusline +=\ %{strftime(\"[%d/%m/%y\ %T]\",getftime(expand(\"%:p\")))}
"set statusline+=%#CursorLineNr#
"set statusline+=\ %y
"set statusline+=\ %r
"set statusline+=%#IncSearch#
"set statusline+=\ %l/%L
"set statusline+=\ [%c]

"set statusline=%<\ %{mode()}\ \|\ %f%m\ \|\ %{fugitive#statusline()\ }
"set statusline+=\ \|\ %{v:lua.workspace_diagnostics_status()}
"set statusline+=%{&paste?'\ \ \|\ PASTE\ ':'\ '}
"set statusline+=%=\ %{&fileformat}\ \|\ %{&fileencoding}\ \|\ %{&filetype}
"set statusline+=\ %l/%L
"set statusline+=\ [%c]
"set statusline+=\ %p%%
"set statusline+=\ %{strftime('[%d/%m/%y\ %T]',getftime(expand('%:p')))}

