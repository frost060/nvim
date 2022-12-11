filetype plugin indent on
syntax enable

call plug#begin()
Plug 'fatih/vim-go', { 'tag': '*' }

Plug 'nvim-treesitter/nvim-treesitter'

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'lifepillar/vim-solarized8'
Plug 'altercation/vim-colors-solarized'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

Plug 'ocaml/vim-ocaml'

Plug 'ocaml/vim-ocaml'

Plug 'nvim-lua/plenary.nvim'

Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'sbdchd/neoformat'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'neovim/nvim-lspconfig'

Plug 'gruvbox-community/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'monsonjeremy/onedark.nvim'
Plug 'voldikss/vim-floaterm'

Plug 'preservim/nerdtree'
Plug 'voldikss/vim-floaterm'

call plug#end()

set autoindent
set backspace=indent,eol,start
" set complete-=i
set smarttab

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

" Basic stuff
set clipboard=unnamed
" set clipboard+=unnamedplus

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
set laststatus=2

" ctags tags file
set tags=./tags;

set number
set colorcolumn=80
set signcolumn=no

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/bundle/*,*/node_modules/*

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

nnoremap <Leader>nh :nohlsearch<CR>

xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
map <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine

nnoremap <silent> <Leader>ff :Ag<CR>
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

lua require("barometer")

" Keybindings
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>fr :NERDTreeFind<CR>

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
nnoremap gr :lua vim.lsp.buf.references()<CR>
nnoremap gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <Leader>ww :lua vim.lsp.buf.hover()<CR>

nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprevious<CR>

nnoremap <Leader>gs :G<CR>
noremap <Leader>gf :diffget //2<CR>
noremap <Leader>gh :diffget //3<CR>

nnoremap <Leader>nh :nohlsearch<CR>

" Float term
let g:floaterm_keymap_toggle = '<Leader>ft'
let g:floaterm_width=0.7
let g:floaterm_height=0.7
let g:floaterm_autoclose=2
tmap <Leader>e exit<CR>

