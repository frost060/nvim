-- require('lualine').setup {
--     options = {
--         icons_enabled = false,
--         theme = 'nord',
--         component_separators = '|',
--         section_separators = '',
--     },
-- }

local function truncate_branch_name(branch)
    if not branch or branch == "" then
        return ""
    end

    -- Match the branch name to the specified format
    local _, _, ticket_number = string.find(branch, "skdillon/sko%-(%d+)%-")

    -- If the branch name matches the format, display sko-{ticket_number}, otherwise display the full branch name
    if ticket_number then
        return "sko-" .. ticket_number
    else
        return branch
    end
end

-- local function kitty_component()
-- 	if vim.g.kitty_layout_is_stack then
-- 		return " "
-- 	end
--
-- 	return ""
-- end

require("lualine").setup {
    options = {
        globalstatus = true,
        theme = "catppuccin",
    },
    sections = {
        lualine_b = {
            { "branch", icon = "", fmt = truncate_branch_name },
            "diff",
            "diagnostics",
        },
        lualine_c = {
            { "filename", path = 1 },
        },
        lualine_x = {
            -- kitty_component,
            "filetype",
        },
    },
}
