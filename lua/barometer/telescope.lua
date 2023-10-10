local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_layout = require "telescope.actions.layout"

local set_prompt_to_entry_value = function(prompt_bufnr)
    local entry = action_state.get_selected_entry()
    if not entry or not type(entry) == "table" then
        return
    end

    action_state.get_current_picker(prompt_bufnr):reset_prompt(entry.ordinal)
end

require("telescope").setup {
    defaults = {
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        multi_icon = "<>",

        -- path_display = "truncate",

        winblend = 0,

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

        mappings = {
            i = {
                ["<RightMouse>"] = actions.close,
                ["<LeftMouse>"] = actions.select_default,
                ["<ScrollWheelDown>"] = actions.move_selection_next,
                ["<ScrollWheelUp>"] = actions.move_selection_previous,

                ["<C-x>"] = false,
                ["<C-s>"] = actions.select_horizontal,
                ["<C-n>"] = "move_selection_next",

                ["<C-e>"] = actions.results_scrolling_down,
                ["<C-y>"] = actions.results_scrolling_up,
                -- ["<C-y>"] = set_prompt_to_entry_value,

                -- These are new :)
                ["<M-p>"] = action_layout.toggle_preview,
                ["<M-m>"] = action_layout.toggle_mirror,
                -- ["<M-p>"] = action_layout.toggle_prompt_position,

                -- ["<M-m>"] = actions.master_stack,

                -- ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                -- ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                -- This is nicer when used with smart-history plugin.
                ["<C-k>"] = actions.cycle_history_next,
                ["<C-j>"] = actions.cycle_history_prev,
                ["<c-g>s"] = actions.select_all,
                ["<c-g>a"] = actions.add_selection,

                -- ["<c-space>"] = function(prompt_bufnr)
                --   local opts = {
                --     callback = actions.toggle_selection,
                --     loop_callback = actions.send_selected_to_qflist,
                --   }
                --   require("telescope").extensions.hop._hop_loop(prompt_bufnr, opts)
                -- end,

                ["<C-w>"] = function()
                    vim.api.nvim_input "<c-s-w>"
                end,
            },

            n = {
                ["<C-e>"] = actions.results_scrolling_down,
                ["<C-y>"] = actions.results_scrolling_up,
            },
        },

        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- file_ignore_patterns = nil,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        history = {
            path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
            limit = 100,
        },
    },

    pickers = {
        find_files = {
            -- I don't like having the cwd prefix in my files
            find_command = vim.fn.executable "fdfind" == 1 and { "fdfind", "--strip-cwd-prefix", "--type", "f" } or nil,
        },

        git_branches = {
            mappings = {
                i = {
                    ["<C-a>"] = false,
                },
            },
        },

        buffers = {
            sort_lastused = true,
            sort_mru = true,
        },
    },

    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },

        fzf_writer = {
            use_highlighter = false,
            minimum_grep_characters = 6,
        },

        hop = {
            -- keys define your hop keys in order; defaults to roughly lower- and uppercased home row
            keys = { "a", "s", "d", "f", "g", "h", "j", "k", "l", ";" }, -- ... and more

            -- Highlight groups to link to signs and lines; the below configuration refers to demo
            -- sign_hl typically only defines foreground to possibly be combined with line_hl
            sign_hl = { "WarningMsg", "Title" },

            -- optional, typically a table of two highlight groups that are alternated between
            line_hl = { "CursorLine", "Normal" },

            -- options specific to `hop_loop`
            -- true temporarily disables Telescope selection highlighting
            clear_selection_hl = false,
            -- highlight hopped to entry with telescope selection highlight
            -- note: mutually exclusive with `clear_selection_hl`
            trace_entry = true,
            -- jump to entry where hoop loop was started from
            reset_selection = true,
        },

        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            },
        },

        -- frecency = {
        --   workspaces = {
        --     ["conf"] = "/home/tj/.config/nvim/",
        --     ["nvim"] = "/home/tj/build/neovim",
        --   },
        -- },
    },
}

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

M.references = function()
    require("telescope.builtin").lsp_references({})
end

M.curr_buffer = function()
    require("telescope.builtin").current_buffer_fuzzy_find(themes.get_ivy())
end

M.live_grep = function()
    require("telescope.builtin").live_grep(themes.get_ivy())
end

M.git_files = function()
    local opts = {
        prompt_prefix = "🔍 ",
        find_command = { "rg", "--hidden", "--files" },
    }
    require("telescope.builtin").git_files(opts)
end

M.buffers = function()
    local opts = themes.get_ivy {
        layout_config = {
            height = 20,
        },
        previewer = false,
    }
    require("telescope.builtin").buffers(opts)
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

M.find_files = function()
    local opts = {
        sorting_strategy = "descending",
        layout_config = {
            -- height = 10,
        },
    }

    require("telescope.builtin").find_files { opts }
end

M.file_browser = function()
    local opts

    opts = {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },

        attach_mappings = function(prompt_bufnr, map)
            local current_picker = action_state.get_current_picker(prompt_bufnr)

            local modify_cwd = function(new_cwd)
                local finder = current_picker.finder

                finder.path = new_cwd
                finder.files = true
                current_picker:refresh(false, { reset_prompt = true })
            end

            map("i", "-", function()
                modify_cwd(current_picker.cwd .. "/..")
            end)

            map("i", "~", function()
                modify_cwd(vim.fn.expand "~")
            end)

            -- local modify_depth = function(mod)
            --   return function()
            --     opts.depth = opts.depth + mod
            --
            --     current_picker:refresh(false, { reset_prompt = true })
            --   end
            -- end
            --
            -- map("i", "<M-=>", modify_depth(1))
            -- map("i", "<M-+>", modify_depth(-1))

            map("n", "yy", function()
                local entry = action_state.get_selected_entry()
                vim.fn.setreg("+", entry.value)
            end)

            return true
        end,
    }

    require("telescope").extensions.file_browser.file_browser(opts)
end

M.current_file = function()
    local opts

    opts = {
        sorting_strategy = "ascending",
        scroll_strategy = "cycle",
        layout_config = {
            prompt_position = "top",
        },

        attach_mappings = function(prompt_bufnr, map)
            local current_picker = action_state.get_current_picker(prompt_bufnr)

            local modify_cwd = function(new_cwd)
                local finder = current_picker.finder

                finder.path = new_cwd
                finder.files = true
                current_picker:refresh(false, { reset_prompt = true })
            end

            map("i", "-", function()
                modify_cwd(current_picker.cwd .. "/..")
            end)

            map("i", "~", function()
                modify_cwd(vim.fn.expand "~")
            end)

            map("n", "yy", function()
                local entry = action_state.get_selected_entry()
                vim.fn.setreg("+", entry.value)
            end)

            return true
        end,

        path = "%:p:h",
    }

    require("telescope").extensions.file_browser.file_browser(opts)
end

function M.git_status()
    require("telescope.builtin").git_status {}
end

function M.git_commits()
    require("telescope.builtin").git_commits {
        winblend = 5,
    }
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

M.anime_selector = image_selector("< Anime Bobs > ", "~/anime-wallpapers")
M.wallpaper = image_selector("< Wallpaper > ", "~/Pictures")

return M
