return {
    "nvim-lualine/lualine.nvim",
    enabled = false,
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    -- init = function()
    --     vim.opt.laststatus = 0
    -- end,
    config = function()
        -- vim.opt.laststatus = 3
        local lualine = require("lualine")
        lualine.setup({
            options = {
                theme = "rose-pine",
                globalstatus = false,
                component_separators = "",
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = {
                    { "mode", separator = { left = "", right = "" }, right_padding = 2 },
                },
                lualine_b = {
                    { "branch", icon = "" },
                    "diff",
                    "diagnostics",
                },
                lualine_c = { "filename" },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress" },
                lualine_z = {
                    { "location", separator = { right = "", left = "" }, left_padding = 2 },
                },
            },
            extensions = { "nvim-tree", "fzf" },
        })
    end,
}
