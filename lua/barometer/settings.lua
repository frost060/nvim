local o = vim.o
local bo = vim.bo
local wo = vim.wo
local cmd = vim.cmd
local g = vim.g

--Incremental live completion
o.inccommand = "nosplit"

--Set highlight on search
o.hlsearch = false

--Make line numbers default
wo.number = true
wo.relativenumber = false
cmd [[ set signcolumn=no ]]

--Do not save when switching buffers
o.hidden = true

--Enable mouse mode
o.mouse = "a"

--Enable break indent
o.breakindent = true

o.cursorline = true

o.wildmenu = true

--Save undo history
cmd [[set undofile]]

--Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

--Decrease update time
o.updatetime = 250

bo.swapfile = false
o.backup = false
cmd [[ set noswapfile ]]

o.syntax = "on"

o.errorbells = false

bo.autoindent = true
bo.smartindent = true

wo.wrap = true

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true

o.diffopt = o.diffopt .. ",vertical"

o.completeopt = "menuone,noselect"
g.completion_matching_strategy_list = { "exact", "substring", "fuzzy" }
