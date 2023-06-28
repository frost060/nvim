let mapleader = ","

" Map jk to <Esc>
inoremap jk <Esc>

" Using Ctrl-Z to save buffer
nnoremap <C-Z> :update<CR>

nnoremap <Leader>e :quit<CR>

nnoremap <Leader>w :bw<CR>

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>

map <C-c> "+y

nnoremap <Leader>gs :G<CR>
noremap <Leader>gf :diffget //2<CR>
noremap <Leader>gh :diffget //3<CR>

nnoremap mm :nohlsearch<CR>

xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
map <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine

" filename [Help][-][RO]
set statusline=\ \ \ %<%f\ %h%m%r
" Line, col
set statusline+=%=%(%l,%c%V%)

" Keybindings
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction
nnoremap <Leader>qq :call ToggleQuickFix()<cr>

" LSP
nnoremap <Leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>ac :lua vim.lsp.buf.code_action()<CR>
nnoremap gd :lua vim.lsp.buf.definition()<CR>
nnoremap gr :lua require('barometer.telescope').lsp_references()<CR>
nnoremap gi :lua require('barometer.telescope').lsp_implementations()<CR>
nnoremap <Leader>aa :lua require('barometer.telescope').anime_selector()<CR>
nnoremap <Leader>ww :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>ds :lua require('barometer.telescope').document_symbols()<CR>
nnoremap <Leader>dd :lua require('barometer.telescope').diagnostics()<CR>
nnoremap <Leader>xx <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <Leader>l :lua require('barometer.telescope').find_files()<CR>
nnoremap <silent> <Leader>gg :lua require('barometer.telescope').git_files()<CR>
nnoremap <silent> <Leader>ff :lua require('barometer.telescope').live_grep()<CR>
nnoremap <silent> <Leader>b :lua require('barometer.telescope').buffers()<CR>
nnoremap <silent> <Leader>ss :lua require('barometer.telescope').curr_buffer()<CR>
nnoremap <silent> <Leader>sc :lua require('barometer.telescope').list_colorschemes()<CR>

nnoremap <C-j> :cnext<CR>;
nnoremap <C-k> :cprevious<CR>

nnoremap <Leader>gs :G<CR>
noremap <Leader>gf :diffget //2<CR>
noremap <Leader>gh :diffget //3<CR>

nnoremap mm :nohlsearch<CR>

nnoremap <Leader>t :TagbarToggle<CR>
" Create new file in current directory
nnoremap <Leader>cs :e %:h/

" Float term
let g:floaterm_keymap_toggle = '<Leader>ft'
let g:floaterm_width=0.7
let g:floaterm_height=0.7
let g:floaterm_autoclose=2
tmap <Leader>e exit<CR>

let g:zig_fmt_autosave = 1

" let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git -o -name dist -o -name build \) -prune -o -print'
" https://gist.github.com/sajoku/c3e12d06f5dcb6bca85402dbc46837ab
" https://dev.to/matrixersp/how-to-use-fzf-with-ripgrep-to-selectively-ignore-vcs-files-4e27
let $FZF_DEFAULT_COMMAND='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,target,.git,.idea,dist,build,tags,*.iml,*.lock,*-lock.json}" '

let g:fzf_layout = { 'down': '~30%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap - :Ex<CR>

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

lua require('barometer')

" Split Join
nnoremap <Leader>sp :TSJToggle<CR>

" https://stackoverflow.com/questions/3702581/how-do-i-indent-a-single-line-multiple-times-in-vi-or-vim
" vnoremap < <gv
" vnoremap > >gv

" https://stackoverflow.com/questions/290465/how-to-paste-over-without-overwriting-registero
xnoremap p "_dP
