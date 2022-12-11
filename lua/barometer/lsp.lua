-- Reference LSP Config (Thorston Ball)
-- https://github.com/mrnugget/vimconfig/blob/master/lua/lsp.lua
local lspconfig = require "lspconfig"

vim.diagnostic.config { float = { source = "always" } }
local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function setup_signs()
  local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end
end

setup_signs()

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(binding, cmd)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", binding, cmd, opts)
  end

  local function create_autocmd(events, callback)
    vim.api.nvim_create_autocmd(events, { buffer = bufnr, callback = callback })
  end

  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  if filetype == "rust" then
    buf_set_keymap("gle", "<cmd>lua vim.lsp.codelens.refresh()<CR>")
    buf_set_keymap("glr", "<cmd>lua vim.lsp.codelens.run()<CR>")
  elseif filetype == "go" then
    -- gopls requires a require to list workspace arguments.
    buf_set_keymap(
      "<leader>fs",
      "lua require('telescope.builtin').lsp_workspace_symbols { query = vim.fn.input('Query: ')"
    )
  end

  -- formatting
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = formatting_augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = formatting_augroup,
      buffer = bufnr,
      callback = function()
        if filetype == "go" then
          require("barometer.lsp.helpers").goimports(2000)
        else
          require("barometer.lsp.helpers").format_lsp(bufnr)
        end
      end,
    })
  end

  create_autocmd("CursorHold", function()
    vim.diagnostic.open_float { focusable = false }
  end)
  -- 300ms of no cursor movement to trigger CursorHold
  vim.cmd [[set updatetime=300]]
  -- have a fixed column for the diagnostics to appear in
  -- this removes the jitter when warnings/errors flow in
  -- vim.cmd [[set signcolumn=yes]]
  -- vim.cmd [[set colorcolumn=80]]
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

require("lspconfig").sqls.setup {
  on_attach = function(client)
    client.resolved_capabilities.execute_command = true
    client.commands = require("sqls").commands -- Neovim 0.6+ only

    require("sqls").setup {}
  end,
}

require("lspconfig").html.setup {
  capabilities = capabilities,
}

-------------------------------------------------------------------------------
-- gopls
-------------------------------------------------------------------------------
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

-------------------------------------------------------------------------------
-- null-ls for TypeScript/JS
-------------------------------------------------------------------------------
local js_filetypes = { "typescriptreact", "scss", "typescript", "javascript", "javascriptreact" }
local null_ls = require "null-ls"
null_ls.setup {
  on_attach = on_attach,
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with {
      filetypes = js_filetypes,
      condition = function(utils)
        return utils.root_has_file { ".eslintrc.js" }
      end,
    },
    null_ls.builtins.code_actions.eslint_d.with { filetypes = js_filetypes },
    null_ls.builtins.formatting.prettier.with {
      filetypes = js_filetypes,
      prefer_local = "node_modules/.bin",
      condition = function(utils)
        return utils.root_has_file { "prettier.config.js", ".prettierrc", ".prettierignore" }
      end,
    },
    null_ls.builtins.formatting.stylua.with {
      filetypes = { "lua" },
    },
    null_ls.builtins.formatting.sql_formatter.with {
      filetypes = { "sql" },
      extra_args = function()
        return {
          "--config",
          vim.fn.expand "~/.vim/sql-formatter.json",
        }
      end,
    },
    null_ls.builtins.formatting.shfmt.with {
      filetypes = { "sh" },
    },
  },
}

-------------------------------------------------------------------------------
-- tsserver for TypeScript
-------------------------------------------------------------------------------
lspconfig.tsserver.setup {
  on_attach = on_attach,
  -- filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
  cmd = { "typescript-language-server", "--stdio" },
  capabilities = capabilities,
}
lspconfig.tailwindcss.setup {}
lspconfig.graphql.setup {}

-- require("typescript").setup {
--   disable_commands = false, -- prevent the plugin from creating Vim commands
--   debug = false, -- enable debug logging for commands
--   go_to_source_definition = {
--     fallback = true, -- fall back to standard LSP definition on failure
--   },
--   server = { -- pass options to lspconfig's setup method
--     on_attach = on_attach,
--   },
-- }

-------------------------------------------------------------------------------
-- lua
-------------------------------------------------------------------------------
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

local cmp = require "cmp"
local cmp_types = require "cmp.types.cmp"

vim.opt.completeopt = "menuone,noselect"

local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  cmp_tabnine = "[TN]",
  path = "[Path]",
}

cmp.setup {
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

vim.g.completion_matching_strategy_list = { "substring", "exact", "fuzzy", "all" }
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_insert_delay = 1
vim.g.completion_chain_complete_list = {
  { complete_items = { "lsp", "snippet" } },
  { mode = "<c-p>" },
  { mode = "<c-n>" },
}

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

-- bufls
require("lspconfig").bufls.setup {}

-- bashls
-- npm i -g bash-language-server
require("lspconfig").bashls.setup {}

-- Jump directly to the first available definition every time.
vim.lsp.handlers["textDocument/definition"] = function(_, result)
  if not result or vim.tbl_isempty(result) then
    print "[LSP] Could not find definition"
    return
  end

  if vim.tbl_islist(result) then
    vim.lsp.util.jump_to_location(result[1], "utf-8")
  else
    vim.lsp.util.jump_to_location(result, "utf-8")
  end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.handlers["textDocument/publishDiagnostics"], {
    signs = {
      severity_limit = "Error",
    },
    underline = {
      severity_limit = "Warning",
    },
    virtual_text = true,
  })

_LspMessageBuffer = _LspMessageBuffer or vim.api.nvim_create_buf(false, true)

require("lspconfig").clangd.setup {
  on_attach = on_attach,
}
