filetype plugin indent on 
syntax enable

call plug#begin()
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'rust-lang/rust.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'ocaml/vim-ocaml'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'ollykel/v-vim'

Plug 'neovim/nvim-lspconfig'             " Required
Plug 'williamboman/mason.nvim'           " Optional
Plug 'williamboman/mason-lspconfig.nvim' " Optional
Plug 'jose-elias-alvarez/null-ls.nvim'

" Autocompletion Engine
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'hrsh7th/cmp-buffer'       " Optional
Plug 'hrsh7th/cmp-path'         " Optional
Plug 'saadparwaiz1/cmp_luasnip' " Optional
Plug 'hrsh7th/cmp-nvim-lua'     " Optional

"  Snippets
Plug 'L3MON4D3/LuaSnip'             " Required
Plug 'rafamadriz/friendly-snippets' " Optional

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v1.x'}

Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'L3MON4D3/LuaSnip'

Plug 'sbdchd/neoformat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}

Plug 'eemed/sitruuna.vim'
Plug 'rose-pine/neovim'
Plug 'Mofiqul/vscode.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'Mofiqul/vscode.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'martinsione/darkplus.nvim'
Plug 'tjdevries/gruvbuddy.nvim'

Plug 'preservim/tagbar'

Plug 'github/copilot.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'dinhhuy258/git.nvim'

call plug#end()

set belloff=all
set noerrorbells
set vb t_vb=

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
nnoremap <Leader>sp :SplitjoinSplit<CR>
nnoremap <Leader>sj :SplitjoinJoin<CR>

" https://stackoverflow.com/questions/3702581/how-do-i-indent-a-single-line-multiple-times-in-vi-or-vim
" vnoremap < <gv
" vnoremap > >gv


