-- TELESCOPE
require("telescope").setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".work/.*",
      ".idea/.*",
      "dist/.*",
      ".git/.*",
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = " 🔍 ",
    selection_caret = "❯ ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    use_less = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "themes", "terms" },
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
  local opts = {
    layout_config = {
      height = 30,
    },
  }
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
  local opts = { hidden = true, sorting_strategy = "ascending" }
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
  local opts = themes.get_dropdown {
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
  local opts = themes.get_ivy {
    layout_config = {
      height = 20,
    },
  }
  require("telescope.builtin").diagnostics(opts)
end

M.list_colorschemes = function()
  local opts = themes.get_dropdown {
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

local function set_background(content)
  local cmd = 'osascript -e \'tell application "Finder" to set desktop picture to POSIX file "' .. content .. "\"'"
  vim.fn.system(cmd)
end

local function select_background(prompt_bufnr, map)
  local function set_the_background(close)
    local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)
    set_background(content.cwd .. "/" .. content.value)
    if close then
      require("telescope.actions").close(prompt_bufnr)
    end
  end

  map("i", "<C-a>", function()
    set_the_background()
  end)

  map("n", "<C-a>", function()
    set_the_background()
  end)

  map("i", "<CR>", function()
    set_the_background(true)
  end)

  map("n", "<CR>", function()
    set_the_background(true)
  end)
end

local function image_selector(prompt, cwd)
  return function()
    require("telescope.builtin").find_files {
      prompt_title = prompt,
      cwd = cwd,

      attach_mappings = function(prompt_bufnr, map)
        select_background(prompt_bufnr, map)

        -- Please continue mapping (attaching additional key maps):
        -- Ctrl+n/p to move up and down the list.
        return true
      end,
    }
  end
end

M.anime_selector = image_selector("< Anime Bobs > ", "~/dev/anime-wallpapers")

return M
