require("telescope").setup {}

local M = {}
local themes = require "telescope.themes"

M.list_colorschemes = function()
    local opts = themes.get_dropdown {
        layout_config = {
            height = 20,
        },
        previewer = false,
    }
    require("telescope.builtin").colorscheme(opts)
end

M.curr_buffer = function()
    require("telescope.builtin").current_buffer_fuzzy_find({})
end

M.live_grep = function()
    require("telescope.builtin").live_grep()
end

M.git_files = function()
    local opts = {
        prompt_prefix = "🔍 ",
        find_command = { "rg", "--hidden", "--files" },
    }
    require("telescope.builtin").git_files(themes.get_dropdown(opts))
end

M.find_files = function()
    require("telescope.builtin").find_files(themes.get_dropdown())
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

M.lsp_references = function()
    local opts = themes.get_ivy {
        layout_config = {
            height = 20,
        },
    }
    require("telescope.builtin").lsp_references(opts)
end

M.lsp_implementations = function()
    local opts = themes.get_ivy {
        layout_config = {
            height = 20,
        },
    }
    require("telescope.builtin").lsp_implementations(opts)
end

M.diagnostics = function()
    local opts = themes.get_ivy {
        layout_config = {
            height = 20,
        },
    }
    require("telescope.builtin").diagnostics(opts)
end

M.document_symbols = function()
    local opts = themes.get_ivy {
        layout_config = {
            height = 20,
        },
    }
    require("telescope.builtin").lsp_document_symbols(opts)
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
M.wallpaper = image_selector("< Wallpaper > ", "~/Pictures")

return M
