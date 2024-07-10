return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = "colorscheme",
    config = function()
        local lualine = require('lualine')
        lualine.setup({
            options = {
                globalstatus = false,
                component_separators = { left = '', right = ''},
                section_separators = { left = '' , right = ''},
                -- component_separators = { left = '', right = ''},
                -- section_separators = { left = '', right = ''},
            }
        })
    end
}
