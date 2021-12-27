local cmd = vim.cmd

local lspconfig_util = require "lspconfig.util"

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local opts = { noremap = true, silent = true }

  local filetype = vim.api.nvim_buf_get_option(0, "filetype")

  if filetype == "rust" then
    vim.cmd [[autocmd BufWritePre <buffer> :lua require('barometer.lsp.helpers').format_rust()]]
    -- Disable this, since we have rust-tools
    -- vim.cmd [[autocmd CursorMoved,InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost <buffer> :lua require'lsp_extensions'.inlay_hints{ prefix = '', highlight = "Whitespace", enabled = {"ChainingHint", "TypeHint", "ParameterHint"} } ]]

    vim.cmd [[autocmd BufEnter,BufNewFile,BufRead <buffer> nmap <buffer> gle <cmd>lua vim.lsp.codelens.refresh()<CR>]]
    vim.cmd [[autocmd BufEnter,BufNewFile,BufRead <buffer> nmap <buffer> glr <cmd>lua vim.lsp.codelens.run()<CR>]]
  end
  if filetype == "go" then
    vim.cmd [[autocmd BufWritePre <buffer> :lua require('lsp.helpers').goimports(2000)]]

    -- gopls requires a require to list workspace arguments.
    vim.cmd [[autocmd BufEnter,BufNewFile,BufRead <buffer> map <buffer> <leader>fs <cmd>lua require('telescope.builtin').lsp_workspace_symbols { query = vim.fn.input("Query: ") }<cr>]]
  end

  if filetype == "typescriptreact" or filetype == "typescript" then
    -- TypeScript/ESLint/Prettier
    -- Requirements:
    --   npm install -g typescript-language-server prettier eslint_d
    --   asdf reshim nodejs

    -- disable tsserver formatting because we use prettier/eslint for that
    client.resolved_capabilities.document_formatting = false

    buf_set_keymap("n", "gs", ":TSLspOrganize<CR>", opts)
    buf_set_keymap("n", "gi", ":TSLspImportAll<CR>", opts)

    vim.cmd "autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()"

    local ts_utils = require "nvim-lsp-ts-utils"
    ts_utils.setup {
      eslint_enable_code_actions = true,
      eslint_enable_disable_comments = true,
      eslint_bin = "eslint_d",
      eslint_enable_diagnostics = true,
      eslint_show_rule_id = true,

      enable_formatting = true,
      formatter = "prettier",
    }

    ts_utils.setup_client(client)
  end

  vim.cmd [[autocmd CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })]]
  -- 300ms of no cursor movement to trigger CursorHold
  vim.cmd [[set updatetime=300]]
  -- have a fixed column for the diagnostics to appear in
  -- this removes the jitter when warnings/errors flow in
  vim.cmd [[set signcolumn=yes]]
  vim.cmd [[set colorcolumn=80]]
end

require("lspconfig").tsserver.setup {}

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

--require("lspconfig").graphql.setup {}

local utils = require "rust-tools.utils.utils"
local rust_execute_command = function(command, args, cwd)
  vim.cmd("T " .. utils.make_command_from_args(command, args))
end

local tools = {
  autoSetHints = false,
  runnables = { use_telescope = true },
  inlay_hints = {
    show_parameter_hints = false,
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

require("lspconfig").elixirls.setup {
  cmd = { "elixir-lsp.sh" },
}

require("lspconfig").zls.setup {
  on_attach = function(_, bufnr)
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    require("completion").on_attach()
  end,
}

require("lspconfig").sqlls.setup {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
}

require("lspconfig").terraformls.setup {}

require("lspconfig").groovyls.setup {
  -- Unix
  cmd = { "groovy-lsp.sh" },
  filetypes = { "groovy", "jenkinsfile" },
}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup {
  capabilities = capabilities,
}

require("lspconfig").gopls.setup {
  on_attach = on_attach_vim,
  cmd = { "gopls", "serve" },
  root_dir = function(fname)
    local Path = require "plenary.path"

    local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
    local absolute_fname = Path:new(fname):absolute()

    if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
      return absolute_cwd
    end

    return lspconfig_util.root_pattern("go.mod", ".git")(fname)
  end,

  settings = {
    on_attach = on_attach,
    capabilities = capabilities,
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      linksInHover = false,
      codelenses = {
        generate = true,
        gc_details = true,
        regenerate_cgo = true,
        tidy = true,
        upgrade_depdendency = true,
        vendor = true,
        test = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      buildFlags = { "-tags=debug" },
      experimentalPostfixCompletions = true,
    },
  },

  flags = {
    debounce_text_changes = 200,
  },
}

require("lspconfig").sumneko_lua.setup {
  cmd = { "lua-lsp.sh" },
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

require("compe").setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "enable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true,
    ultisnip = true,
    luasnip = true,
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
    return vim.fn["compe#complete"]()
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

--This line is important for auto-import
vim.api.nvim_set_keymap("i", "<cr>", 'compe#confirm("<cr>")', { expr = true })
vim.api.nvim_set_keymap("i", "<c-space>", "compe#complete()", { expr = true })

cmd [[
augroup BAROMETER_JENKINSFILE
    au BufNewFile,BufRead Jenkinsfile setf groovy
augroup END
]]

cmd [[
augroup BAROMETER_JDTLS
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
    autocmd FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
augroup END
]]

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
