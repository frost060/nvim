-- TELESCOPE
require("telescope").setup {
  defaults = {
    prompt_prefix = "$ ",
    file_ignore_patterns = {
      "node_modules",
      ".work/.*",
      ".cache/.*",
      ".idea/.*",
      "dist/.*",
      ".git/.*",
    },
  },
}

local M = {}

M.curr_buffer = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
  }
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

M.live_grep = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
  }
  require("telescope.builtin").live_grep(opts)
end

M.find_files = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
    previewer = false,
    prompt_prefix = "🔍",
    find_command = { "rg", "--hidden", "--files" },
  }
  require("telescope.builtin").find_files(opts)
end

M.file_browser = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
  }
  require("telescope.builtin").file_browser(opts)
end

M.find_current_file = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
    cwd = vim.fn.expand "%:p:h",
  }
  require("telescope.builtin").file_browser(opts)
end

M.buffers = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
    previewer = false,
  }
  require("telescope.builtin").buffers(opts)
end

M.document_symbols = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
    previewer = false,
  }
  require("telescope.builtin").lsp_document_symbols(opts)
end

M.diagnostics = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
  }
  require("telescope.builtin").diagnostics(opts)
end

M.list_colorschemes = function()
  local opts = require("telescope.themes").get_dropdown {
    layout_config = {
      height = 20,
    },
    previewer = false,
  }
  require("telescope.builtin").colorscheme(opts)
end

M.lsp_references = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
  }
  require("telescope.builtin").lsp_references(opts)
end

M.lsp_implementations = function()
  local opts = require("telescope.themes").get_ivy {
    layout_config = {
      height = 20,
    },
  }
  require("telescope.builtin").lsp_implementations(opts)
end

M.git_status = function()
  require("telescope.builtin").git_status {}
end

return M
