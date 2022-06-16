" Map jk to <Esc>
inoremap jk <Esc>

" Using Ctrl-Z to save buffer
nnoremap <C-Z> :update<CR>

nnoremap <Leader>e :quit<CR>

nnoremap <Leader>w :bw<CR>

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>

map <C-c> "+y

" fugitive
nnoremap <Leader>gs :G<CR>
noremap <Leader>gf :diffget //2<CR>
noremap <Leader>gh :diffget //3<CR>

nnoremap <Leader>nh :nohlsearch<CR>

" Telescope
nmap <silent> <Leader>l <cmd>lua require('barometer.telescope').find_files()<CR>
nmap <silent> <Leader>gg <cmd>lua require('barometer.telescope').git_files()<CR>
nmap <silent> <Leader>ff <cmd>lua require('barometer.telescope').live_grep()<CR>
nmap <silent> <Leader>fa <cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>
nmap <silent> <Leader>ss <cmd>lua require('barometer.telescope').curr_buffer()<CR>
nmap <silent> <Leader>b <cmd>lua require('barometer.telescope').buffers()<CR>
nmap <silent> <Leader>tr <cmd>lua require('barometer.telescope').find_current_file()<CR>
nmap <silent> <Leader>ds <cmd>lua require('barometer.telescope').document_symbols()<CR>
nmap <silent> <Leader>dd <cmd>lua require('barometer.telescope').diagnostics()<CR>
nmap <silent> <Leader>sc <cmd>lua require('barometer.telescope').list_colorschemes()<CR>
nmap <silent> <Leader>bb <cmd>lua require('barometer.telescope').anime_selector()<CR>
nnoremap gr <cmd>lua require('barometer.telescope').lsp_references()<CR>
nnoremap gi <cmd>lua require('barometer.telescope').lsp_implementations()<CR>
nmap <silent> <Leader>h <cmd>Telescope help_tags<CR>
nmap <silent> <Leader>t <cmd>Telescope<CR>

" LSP
nnoremap <Leader>wd :lua vim.lsp.buf.signature_help()<CR>
nnoremap <Leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <Leader>ac :lua vim.lsp.buf.code_action()<CR>
nnoremap <Leader>ww :lua vim.lsp.buf.hover()<CR>
nnoremap <Leader>wo :lua vim.diagnostic.open_float()<CR>
nnoremap <Leader>wn :lua vim.diagnostic.goto_next()<CR>
nnoremap <Leader>wp :lua vim.diagnostic.goto_prev()<CR>
nnoremap gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap gt <cmd>lua vim.lsp.buf.type_definition()<CR>

" Split Join
nnoremap <Leader>sp :SplitjoinSplit<CR>
nnoremap <Leader>sj :SplitjoinJoin<CR>

" Lir
nmap <silent> <Leader>rr <cmd> lua require('lir.float').toggle()<CR>

nnoremap <Leader>q <C-w>w

function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <Leader>qq :call ToggleQuickFix()<CR>

xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
omap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine

nmap mm :nohl<CR>
