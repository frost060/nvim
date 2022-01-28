"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Markdown
augroup ft_markdown
  au!
  au BufNewFile,BufRead *.md setlocal filetype=markdown

  au Filetype markdown setlocal textwidth=80
  au Filetype markdown setlocal smartindent " Indent lists correctly
  au FileType markdown setlocal nolist
  " Taken from here: https://github.com/plasticboy/vim-markdown/issues/232
  au FileType markdown
      \ set formatoptions-=q |
      \ set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+
augroup END

" C
augroup ft_c
  au!
  au BufNewFile,BufRead *.h setlocal filetype=c
  au Filetype c setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
  au Filetype c setlocal cinoptions=l1,t0,g0 " This fixes weird indentation of switch/case
augroup END

" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" Go
augroup ft_golang
  au!

  au BufEnter,BufNewFile,BufRead *.go setlocal formatoptions+=roq
  au BufEnter,BufNewFile,BufRead *.go
        \ setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
  au BufEnter,BufNewFile,BufRead *.tmpl setlocal filetype=html
augroup END

" Rust
augroup ft_rust
  au!
  au BufEnter,BufNewFile,BufRead *.rs :compiler cargo
  "au FileType rust set nolist
augroup END

" Racket
augroup ft_racket
  au!
  au BufEnter,BufNewFile,BufRead *.rkt set filetype=racket
augroup END

" GNU Assembler
augroup ft_asm
  au!
  " Insert comments automatically on return in insert and when using O/o in
  " normal mode
  au FileType asm setlocal formatoptions+=ro
  au FileType asm setlocal commentstring=#\ %s
augroup END

" Merlin setup for Ocaml
" if executable('opam')
"   let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"   execute "set rtp+=" . g:opamshare . "/merlin/vim"
"
"   let g:merlin_split_method = "never"
"   let g:merlin_textobject_grow   = 'm'
"   let g:merlin_textobject_shrink = 'M'
" endif

" OCaml
augroup ft_ocaml
  au!

  au Filetype ocaml nmap <c-]> gd

  au Filetype ocaml nmap <leader>ot :MerlinTypeOf<CR>
  au Filetype ocaml nmap <leader>og :MerlinGrowEnclosing<CR>
  au Filetype ocaml nmap <leader>os :MerlinShrinkEnclosing<CR>
augroup END

" YAML
augroup ft_yaml
  au!
  au FileType yaml setlocal nolist
  au FileType yaml setlocal number
  au FileType yaml setlocal colorcolumn=0
augroup END

" Java
augroup ft_java
  au!
  au BufEnter,BufNewFile,BufRead *.java setlocal colorcolumn=0
augroup END

" Quickfix List
"
" Adjust height of quickfix window
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
augroup ft_quickfix
    autocmd!
    " Autowrap long lines in the quickfix window
    autocmd FileType qf setlocal wrap
    autocmd FileType qf call AdjustWindowHeight(3, 10)
augroup END

