syntax enable
filetype on
filetype plugin on
filetype indent on

" Make syntax highlighting faster
syntax sync minlines=256

" Shut up.
set noerrorbells
set visualbell

" Basic stuff
" set clipboard=unnamed
set clipboard+=unnamedplus

set showmode
set showcmd
set history=500
set nocompatible
set hidden
set wildmenu
set scrolloff=5
set number
set relativenumber
set cursorline
set wrap
set showmatch
set backspace=2
" Make J not insert whitespace
set nojoinspaces
" Allow project-specific vimrc files
set exrc
set shiftround
set modeline


" Backup
set undofile
set undodir=~/.vim/tmp/undo//
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
set softtabstop=2
set shiftround
set expandtab

set list
set listchars=tab:▸\ ,extends:❯,precedes:❮
set ruler
set laststatus=2

" ctags tags file
set tags=./tags;

" set colorcolumn=80
set signcolumn=yes

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/bundle/*,*/node_modules/*

" Use ripgrep with fzz as :grep
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

" Set completeopt to have a better completion experience
set completeopt=menu,menuone,noselect

" Enable completions as you type
let g:completion_enable_auto_popup = 1

set updatetime=250
set formatoptions-=c formatoptions-=r formatoptions-=o
au BufEnter * set fo-=c fo-=r fo-=o

let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

let g:vsnip_snippet_dir = "~/.vim/snippets"
