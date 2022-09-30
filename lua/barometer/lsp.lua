-- Reference LSP Config (Thorston Ball)
-- https://github.com/mrnugget/vimconfig/blob/master/lua/lsp.lua
local cmd = vim.cmd

local function setup_signs()
  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

setup_signs()

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  if filetype == "rust" then
    vim.cmd [[autocmd BufWritePre <buffer> :lua require('barometer.lsp.helpers').format_rust()]]

    vim.cmd [[autocmd BufEnter,BufNewFile,BufRead <buffer> nmap <buffer> gle <cmd>lua vim.lsp.codelens.refresh()<CR>]]
    vim.cmd [[autocmd BufEnter,BufNewFile,BufRead <buffer> nmap <buffer> glr <cmd>lua vim.lsp.codelens.run()<CR>]]
  end
  if filetype == "go" then
    vim.cmd [[autocmd BufWritePre <buffer> :lua require('barometer.lsp.helpers').goimports(2000)]]

    -- gopls requires a require to list workspace arguments.
    vim.cmd [[autocmd BufEnter,BufNewFile,BufRead <buffer> map <buffer> <leader>fs <cmd>lua require('telescope.builtin').lsp_workspace_symbols { query = vim.fn.input("Query: ") }<cr>]]
  end

  --if filetype == "sql" then
  --vim.cmd "autocmd BufWritePre *.sql lua vim.lsp.buf.formatting()"
  --end

  if filetype == "typescriptreact" or filetype == "typescript" then
    -- TypeScript/ESLint/Prettier
    -- Requirements:
    --   npm install -g typescript-language-server prettier eslint_d
    --   asdf reshim nodejs

    -- disable tsserver formatting because we use prettier/eslint for that
    -- client.resolved_capabilities.document_formatting = false

    vim.cmd "set tabstop=2"
    vim.cmd "set shiftwidth=2"
    vim.cmd "set softtabstop=4"
    vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()"

    local ts_utils = require "nvim-lsp-ts-utils"
    ts_utils.setup {
      debug = true,
      enable_import_on_completion = true,
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint_d",
      eslint_enable_diagnostics = true,
      eslint_show_rule_id = true,
      auto_inlay_hints = false,

      enable_formatting = true,
      formatter = "prettier",

      update_imports_on_move = true,
    }

    ts_utils.setup_client(client)
  end

  -- https://github.com/neovim/nvim-lspconfig/wiki/UI-customization#show-source-in-diagnostics
  vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
  -- [DEPRECATED] vim.cmd [[autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })]]
  -- 300ms of no cursor movement to trigger CursorHold
  vim.cmd [[set updatetime=300]]
  -- have a fixed column for the diagnostics to appear in
  -- this removes the jitter when warnings/errors flow in
  vim.cmd [[set signcolumn=yes]]
  -- vim.cmd [[set colorcolumn=100]]
end

-- dockerls
-- npm install -g dockerfile-language-server-nodejs
require("lspconfig").dockerls.setup {}

require("lspconfig").jsonls.setup {
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line "$", 0 })
      end,
    },
  },
}

require("lspconfig").vimls.setup {}

require("lspconfig").yamlls.setup {}

require("lspconfig").ocamlls.setup {}

require("lspconfig").elixirls.setup {
  cmd = { "elixir-lsp.sh" },
}

require("lspconfig").zls.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    require("completion").on_attach()
  end,
}

require("lspconfig").sqls.setup {
  on_attach = function(client)
    client.resolved_capabilities.execute_command = true
    client.commands = require("sqls").commands -- Neovim 0.6+ only

    require("sqls").setup {}
  end,
}

require("lspconfig").terraformls.setup {}

require("lspconfig").groovyls.setup {
  -- Unix
  cmd = { "groovy-lsp.sh" },
  filetypes = { "groovy", "jenkinsfile" },
}

require("lspconfig").html.setup {
  capabilities = capabilities,
}

require("lspconfig").gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    gopls = {
      completeUnimported = true,
      buildFlags = { "-tags=debug" },
      ["local"] = "github.com/sourcegraph/sourcegraph",
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      experimentalPostfixCompletions = true,
    },
  },
  flags = {
    debounce_text_changes = 200,
  },
}

require("null-ls").setup {
  sources = {
    require("null-ls").builtins.diagnostics.golangci_lint,
  },
}

local util = require "lspconfig/util"
require("lspconfig").tsserver.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 200,
  },
  root_dir = util.root_pattern ".git",
}

-- brew install lua-language-server
require("lspconfig").sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
    },
  },
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col "." - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
    return true
  else
    return false
  end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    --return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

cmd [[
augroup BAROMETER_JENKINSFILE
    au BufNewFile,BufRead Jenkinsfile setf groovy
augroup END
]]

-- cmd [[
-- augroup BAROMETER_JDTLS
--     autocmd!
--     autocmd BufWritePre * %s/\s\+$//e
--     autocmd FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
-- augroup END
-- ]]

function _G.workspace_diagnostics_status()
  if #vim.lsp.buf_get_clients() == 0 then
    return ""
  end

  local ws_diag = require "lsp_extensions.workspace.diagnostic"

  local status = {}
  local errors = ws_diag.get_count(0, "Error")
  if errors > 0 then
    table.insert(status, "E: " .. errors)
  end

  local warnings = ws_diag.get_count(0, "Warning")
  if warnings > 0 then
    table.insert(status, "W: " .. warnings)
  end

  local hints = ws_diag.get_count(0, "Hint")
  if hints > 0 then
    table.insert(status, "H: " .. hints)
  end

  return table.concat(status, " | ")
end

local cmp = require "cmp"
local cmp_types = require "cmp.types.cmp"

vim.opt.completeopt = "menuone,noselect"

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local cmp_window = require "cmp.utils.window"

function cmp_window:has_scrollbar()
  return false
end

local lspkind = require "lspkind"
require("lspkind").init {
  mode = "symbol_text",
  -- preset = "codicons",
}
local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}

cmp.setup {
  window = {
    completion = {
      border = border "CmpBorder",
    },
    documentation = {
      border = border "CmpDocBorder",
    },
  },
  mapping = {
    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp_types.SelectBehavior.Select },
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp_types.SelectBehavior.Select },
    ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp_types.SelectBehavior.Insert },
    ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp_types.SelectBehavior.Insert },
  },
  formatting = {
    format = function(entry, vim_item)
      local icons = require "barometer.lspkind_icons"
      vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      local menu = source_mapping[entry.source.name]
      if entry.source.name == "cmp_tabnine" then
        if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
          menu = entry.completion_item.data.detail .. " " .. menu
        end
        vim_item.kind = ""
      end
      vim_item.menu = menu
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      -- vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      require("luasnip").lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    -- tabnine completion? yayaya

    { name = "cmp_tabnine" },

    { name = "nvim_lsp" },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    { name = "luasnip" },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = "buffer" },
  },
}

local tabnine = require "cmp_tabnine.config"
tabnine:setup {
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  run_on_every_keystroke = true,
  snippet_placeholder = "..",
}

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

local utils = require "rust-tools.utils.utils"
local rust_execute_command = function(command, args, cwd)
  vim.cmd("T " .. utils.make_command_from_args(command, args))
end

local tools = {
  autoSetHints = true,
  runnables = { use_telescope = true },
  inlay_hints = {
    show_parameter_hints = true,
    highlight = "Whitespace",
  },
  hover_actions = { auto_focus = true },
  executor = {
    execute_command = rust_execute_command,
  },
}

require("rust-tools").setup {
  tools = tools,
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 200,
    },
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        completion = {
          autoimport = {
            enable = true,
          },
        },
      },
    },
  },
}

function _G.workspace_diagnostics_status()
  if #vim.lsp.buf_get_clients() == 0 then
    return ""
  end

  local status = {}
  local errors =
    #vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR } })
  if errors > 0 then
    table.insert(status, "E: " .. errors)
  end

  local warnings = #vim.diagnostic.get(
    0,
    { severity = { min = vim.diagnostic.severity.WARNING, max = vim.diagnostic.severity.WARNING } }
  )
  if warnings > 0 then
    table.insert(status, "W: " .. warnings)
  end

  local hints =
    #vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.HINT, max = vim.diagnostic.severity.HINT } })
  if hints > 0 then
    table.insert(status, "H: " .. hints)
  end

  local infos =
    #vim.diagnostic.get(0, { severity = { min = vim.diagnostic.severity.INFO, max = vim.diagnostic.severity.INFO } })
  if infos > 0 then
    table.insert(status, "I: " .. infos)
  end

  return table.concat(status, " | ")
end

-- lsp-trouble.nvim
require("trouble").setup {
  auto_preview = false,
  auto_close = true,
}

vim.api.nvim_set_keymap(
  "n",
  "<leader>xx",
  "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true }
)

vim.g.completion_matching_strategy_list = { "substring", "exact", "fuzzy", "all" }
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  { complete_items = { "lsp", "snippet" } },
  { mode = "<c-p>" },
  { mode = "<c-n>" },
}

local opts = {
  -- whether to highlight the currently hovered symbol
  -- disable if your cpu usage is higher than you want it
  -- or you just hate the highlight
  -- default: true
  highlight_hovered_item = true,

  -- whether to show outline guides
  -- default: true
  show_guides = true,
}

require("symbols-outline").setup(opts)

local snippets_paths = function()
  local plugins = { "friendly-snippets" }
  local paths = {}
  local path
  local root_path = vim.env.HOME .. "/.vim/plugged/"
  for _, plug in ipairs(plugins) do
    path = root_path .. plug
    if vim.fn.isdirectory(path) ~= 0 then
      table.insert(paths, path)
    end
  end
  return paths
end

require("luasnip.loaders.from_vscode").lazy_load {
  paths = snippets_paths(),
  include = nil, -- Load all languages
  exclude = {},
}

-- bufls
require("lspconfig").bufls.setup {}

-- bashls
-- npm i -g bash-language-server
require("lspconfig").bashls.setup {}
