hi clear LineNr
hi LineNr guifg=#797A7B


augroup Theme
    autocmd vimenter * hi link @variable.python variable
    autocmd vimenter * hi link @lsp.type.variable.lua variable
    autocmd vimenter * hi link @lsp.type.variable.ocaml variable
    autocmd vimenter * hi link @lsp.type.variable.rust variable
    autocmd vimenter * hi link @lsp.type.variable.python variable
    autocmd vimenter * hi link @variable.python variable
    autocmd vimenter * hi link @field.python variable
    autocmd vimenter * hi link @lsp.type.namespace @namespace
    autocmd vimenter * hi link @punctuation.bracket.rapper @text.literal
    autocmd vimenter * hi link @normal Normal
augroup end
