-- TELESCOPE
require("telescope").setup {
  defaults = {
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",

    winblend = 0,

    file_ignore_patterns = {
      "node_modules",
      ".work/.*",
      ".cache/.*",
      ".idea/.*",
      "dist/.*",
      ".git/.*",
    },

    layout_strategy = "horizontal",
    layout_config = {
      width = 0.95,
      height = 0.85,
      -- preview_cutoff = 120,
      prompt_position = "top",

      horizontal = {
        preview_width = function(_, cols, _)
          if cols > 200 then
            return math.floor(cols * 0.4)
          else
            return math.floor(cols * 0.6)
          end
        end,
      },

      vertical = {
        width = 0.9,
        height = 0.95,
        preview_height = 0.5,
      },

      flex = {
        horizontal = {
          preview_width = 0.9,
        },
      },
    },

    selection_strategy = "reset",
    sorting_strategy = "descending",
    scroll_strategy = "cycle",
    color_devicons = true,
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },

  file_previewer = require("telescope.previewers").vim_buffer_cat.new,
  grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
  qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
}

--To get fzf loaded and working with telescope
_ = require("telescope").load_extension "notify"
_ = require("telescope").load_extension "file_browser"
_ = require("telescope").load_extension "ui-select"
_ = require("telescope").load_extension "fzf"
_ = require("telescope").load_extension "neoclip"

local M = {}
local themes = require "telescope.themes"

M.curr_buffer = function()
  local opts = {}
  require("telescope.builtin").current_buffer_fuzzy_find(opts)
end

M.live_grep = function()
  local opts = {}
  require("telescope.builtin").live_grep(opts)
end

M.git_files = function()
  local opts = {
    prompt_prefix = "🔍",
    find_command = { "rg", "--hidden", "--files" },
  }
  require("telescope.builtin").git_files(opts)
end

M.find_files = function()
  local opts = themes.get_ivy { hidden = false, sorting_strategy = "ascending" }
  require("telescope.builtin").find_files(opts)
end

M.file_browser = function()
  local opts = {
    prompt_prefix = "🔍",
    find_command = { "rg", "--hidden", "--files" },
  }
  require("telescope.builtin").file_browser(opts)
end

M.find_current_file = function()
  local opts = {
    cwd = vim.fn.expand "%:p:h",
  }
  require("telescope.builtin").file_browser(opts)
end

M.buffers = function()
  local opts = require("telescope.themes").get_dropdown {
    layout_config = {
      height = 20,
    },
    previewer = false,
  }
  require("telescope.builtin").buffers(opts)
end

M.document_symbols = function()
  local opts = {}
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
  local opts = {}
  require("telescope.builtin").lsp_references(opts)
end

M.lsp_implementations = function()
  local opts = {}
  require("telescope.builtin").lsp_implementations(opts)
end

M.git_status = function()
  require("telescope.builtin").git_status {}
end

return M
