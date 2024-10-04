return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "colorscheme",
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            options = {
                globalstatus = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                -- section_separators = { left = '' , right = ''},
                -- component_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = ''},
            },
            -- sections = {
            --     lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
            --     lualine_b = { 'filename', 'branch', 'diagnostics' },
            --     lualine_c = {
            --         '%=', --[[ add your center compoentnts here in place of this comment ]]
            --     },
            --     lualine_x = {},
            --     lualine_y = { 'filetype', 'progress' },
            --     lualine_z = {
            --         { 'location', separator = { right = '' }, left_padding = 2 },
            --     },
            -- },
            -- inactive_sections = {
            --     lualine_a = { 'filename' },
            --     lualine_b = {},
            --     lualine_c = {},
            --     lualine_x = {},
            --     lualine_y = {},
            --     lualine_z = { 'location' },
            -- },
            -- tabline = {},
            -- extensions = {},
        }
        )
    end
}
