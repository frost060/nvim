vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.o.breakindent = true
vim.opt.clipboard = "unnamedplus"

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no"
vim.opt.isfname:append "@-@"

vim.opt.updatetime = 50
vim.opt.laststatus = 3
vim.opt.cmdheight = 1

vim.g.loaded_gzip = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1

vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1

vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
-- move winbar text to the center
-- vim.opt.winbar = "%=%{expand('%:p:h:t')}/%t%="
-- vim.opt.winbar = "%=%f%="

-- vim.cmd [[
--     set listchars=tab:⭲\ ,trail:~,extends:>,precedes:<,space:·
--     set list
--     hi Whitespace guifg=#505050
--     hi NonText guifg=#505050
-- ]]

-- vim.cmd [[
--     set list
--     set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
-- ]]

-- vim.cmd [[
--     set list
--     set listchars+=eol:↲
-- ]]
