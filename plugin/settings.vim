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
" set cursorline
set colorcolumn=80
set nowrap
set showmatch
set backspace=2
" Make J not insert whitespace
set nojoinspaces
" Allow project-specific vimrc files
set exrc

" Time out on key codes, not mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Some tuning for macvim
set ttyfast
if !has('nvim')
  set lazyredraw
end

" Show incremental search/replace
if has('nvim')
  set inccommand=nosplit
end

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
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set listchars=tab:▸\ ,extends:❯,precedes:❮
set ruler
set laststatus=2

" ctags tags file
set tags=./tags;

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/vendor/bundle/*,*/node_modules/*

" Use ripgrep with fzz as :grep
if executable('rg')
  set grepprg=rg\ --vimgrep
endif

set signcolumn=yes

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Enable completions as you type
let g:completion_enable_auto_popup = 1
