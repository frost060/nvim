local lsp = require "lsp-zero"
local cmp = require "cmp"
local uv = vim.loop
local handle

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- then setup your lsp server as usual
local lspconfig = require "lspconfig"

-- example to setup lua_ls and enable call snippets
lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
        },
    },
}

lsp.preset "recommended"
lsp.ensure_installed {
    "tsserver",
    "rust_analyzer",
    "pyright",
    "gopls",
    "sqlls",
}

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-u>"] = cmp.mapping.scroll_docs(4),  -- scroll up preview
    ["<C-d>"] = cmp.mapping.scroll_docs(-4), -- scroll down preview
}

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp {
    mapping = cmp_mappings,
}

lsp.set_preferences {
    suggest_lsp_servers = false,
    sign = false,
    sign_icons = {
        error = "E",
        warn = "W",
        hint = "H",
        info = "I",
    },
}

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function()
        vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "K", function()
        vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_prev()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
        vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
        vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set("n", "gr", function()
        require("barometer.telescope").references()
    end, opts)

    local filetype = vim.api.nvim_buf_get_option(0, "filetype")

    -- autocmd BufWritePre * silent !reorder-python-imports %
    if filetype == "python" then
        vim.cmd [[]]
    elseif filetype == "javascript" or filetype == "typescript" or filetype == "json" then
        vim.cmd [[autocmd BufWritePost * silent !prettier --tab-width 4 --write %]]
    end
end)

lsp.setup()

vim.diagnostic.config {
    virtual_text = true,
    sign = true,
}

function _G.workspace_diagnostics_status()
    if #vim.lsp.buf_get_clients() == 0 then
        return ""
    end

    local status = {}
    local errors = #vim.diagnostic.get(
        0,
        { severity = { min = vim.diagnostic.severity.ERROR, max = vim.diagnostic.severity.ERROR } }
    )
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

    local hints = #vim.diagnostic.get(
        0,
        { severity = { min = vim.diagnostic.severity.HINT, max = vim.diagnostic.severity.HINT } }
    )
    if hints > 0 then
        table.insert(status, "H: " .. hints)
    end

    local infos = #vim.diagnostic.get(
        0,
        { severity = { min = vim.diagnostic.severity.INFO, max = vim.diagnostic.severity.INFO } }
    )
    if infos > 0 then
        table.insert(status, "I: " .. infos)
    end

    return table.concat(status, " | ")
end
