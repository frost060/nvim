local o = vim.o
local api = vim.api
local g = vim.g
local cmd = vim.cmd

api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true })
api.nvim_set_keymap("n", "<C-Z>", ":update<CR>", { noremap = true })

api.nvim_set_keymap("n", "<Leader>e", ":quit<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>w", ":bw<CR>", { noremap = true })

api.nvim_set_keymap("n", "<C-j>", ":cnext<CR>", { noremap = true })
api.nvim_set_keymap("n", "<C-k>", ":cprevious<CR>", { noremap = true })

api.nvim_set_keymap("", "<C-c>", '"+y', {})

api.nvim_set_keymap("n", "<Leader>gs", ":G<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>gf", ":diffget //2<CR>", { noremap = true })
api.nvim_set_keymap("n", "<Leader>gh", ":diffget //3<CR>", { noremap = true })

api.nvim_set_keymap("n", "<Leader>nh", ":nohlsearch<CR>", { noremap = true })

api.nvim_set_keymap(
  "n",
  "<Leader>l",
  [[<cmd>lua require("barometer.telescope").find_files()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  [[<cmd>lua require("barometer.telescope").live_grep()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>ss",
  [[<cmd>lua require("barometer.telescope").curr_buffer()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>b",
  [[<cmd>lua require("barometer.telescope").buffers()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  [[<cmd>lua require("barometer.telescope").file_browser()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>tr",
  [[<cmd>lua require("barometer.telescope").find_current_file()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>ds",
  [[<cmd>lua require("barometer.telescope").document_symbols()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>dd",
  [[<cmd>lua require("barometer.telescope").document_diagnostics()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>wd",
  [[<cmd>lua require("barometer.telescope").workspace_diagnostics()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>c",
  [[<cmd>lua require("barometer.telescope").list_colorschemes()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap(
  "n",
  "<Leader>gg",
  [[<cmd>lua require("barometer.telescope").git_status()<CR>]],
  { noremap = false, silent = true }
)

api.nvim_set_keymap("n", "<Leader>h", [[<cmd>Telescope help_tags<CR>]], { noremap = true, silent = true })
api.nvim_set_keymap("n", "<Leader>t", [[<cmd>Telescope<CR>]], { noremap = true, silent = true })

api.nvim_set_keymap("n", "gd", [[:lua vim.lsp.buf.definition()<CR>]], { noremap = true })

api.nvim_set_keymap(
  "n",
  "gi",
  [[<cmd> lua require("barometer.telescope").lsp_implementations()<CR>]],
  { noremap = true }
)
--api.nvim_set_keymap("n", "gi", [[:lua vim.lsp.buf.implementation()<CR>]], { noremap = true })

api.nvim_set_keymap("n", "gh", [[:lua vim.lsp.buf.signature_help()<CR>]], { noremap = true })

--api.nvim_set_keymap("n", "gr", [[:lua vim.lsp.buf.references()<CR>]], { noremap = true })
api.nvim_set_keymap("n", "gr", [[<cmd> lua require("barometer.telescope").lsp_references()<CR>]], { noremap = true })

api.nvim_set_keymap("n", "<Leader>rn", [[:lua vim.lsp.buf.rename()<CR>]], { noremap = true })
--api.nvim_set_keymap("n", "<Leader>gh", [[:lua vim.lsp.buf.hover()<CR>]], { noremap = true })

api.nvim_set_keymap("n", "<Leader>ac", [[:lua vim.lsp.buf.code_action()<CR>]], { noremap = true })
api.nvim_set_keymap("n", "<Leader>ac", [[<cmd>lua require('jdtls').code_action()<CR>]], { noremap = true })

-- TODO: Convert this to pure lua
cmd [[
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <Leader>qq :call ToggleQuickFix()<cr>
]]

cmd [[
nnoremap <Leader>q <C-w>w
]]

api.nvim_set_keymap("n", "<Leader>rr", [[<cmd>lua require'lir.float'.toggle()<CR>]], {
  noremap = false,
  silent = true,
})
