require "barometer.plugins"
require "barometer.treesitter"
require "barometer.telescope"
require "barometer.lsp"
require "barometer.set"
require "barometer.formatter"

require("which-key").setup {}
require("nvim-autopairs").setup {}
require("nvim-nonicons").setup {}

require("conform").setup {
    formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "reorder-python-imports", "black" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_fallback = true,
    },
}
