filetype plugin indent on 
syntax enable

call plug#begin()
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'rust-lang/rust.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
" Plug 'jiangmiao/auto-pairs'

Plug 'ocaml/vim-ocaml'
Plug 'cespare/vim-toml', { 'branch': 'main' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'ollykel/v-vim'

Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'L3MON4D3/LuaSnip'

Plug 'sbdchd/neoformat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'neovim/nvim-lspconfig'

Plug 'gruvbox-community/gruvbox'
Plug 'eemed/sitruuna.vim'
Plug 'tjdevries/colorbuddy.nvim'
Plug 'svrana/neosolarized.nvim'
Plug 'Mofiqul/dracula.nvim'

Plug 'nvim-lualine/lualine.nvim'

Plug 'preservim/tagbar'

call plug#end()

set autoindent
set backspace=indent,eol,start
" set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

" Basic stuff
" set clipboard=unnamed
set clipboard+=unnamedplus

set noshowmode
set showcmd
set history=500
set nocompatible
set hidden
set wildmenu
set scrolloff=5
set nonumber
" set relativenumber
set nocursorline
set wrap
set showmatch
set backspace=2
" Make J not insert whitespace
set nojoinspaces
" Allow project-specific vimrc files
set exrc
set shiftround
set modeline
set termguicolors

set nolbr
set tw=0

" Backup
set backupdir=~/.vim/tmp/backup//
set backup
set noswapfile

" Resize vim windows when resizing the main window
au VimResized * :wincmd =

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase  "Do not ignore case, if uppercase is in search term

" Indenting
set tabstop=2
set shiftwidth=2
set softtabstop=4
set shiftround
set expandtab
set ruler
set undofile

" ctags tags file
set tags=./tags;

set colorcolumn=0
set signcolumn=no

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/bundle/*,*/node_modules/*

set formatoptions = "tcrqn"

let g:completion_enable_auto_popup = 1

" Use ripgrep with fzz as :grep
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect

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

nnoremap <silent> <Leader>ff :Rg<CR>
nnoremap <silent> <Leader>l :FZF<CR>
nnoremap <silent> <Leader>gg :GFiles<CR>
nnoremap <silent> <Leader>ss :Lines<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>sc :Colors<CR>
nnoremap <silent> <Leader>h :History<CR>

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

" nnoremap <unique> <tab> %
" vnoremap <unique> <tab> %
" tabe %

" https://vim.fandom.com/wiki/Open_every_buffer_in_its_own_tabpage
" augroup Tabs
"   au BufAdd,BufNewFile,BufRead * nested tab sball
" augroup end

