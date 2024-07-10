local config = function()
    local lualine = require('lualine')
    local theme = require('lualine.themes.catppuccin')

    -- set transparent background
    theme.normal.c.bg = nil
    --[[ theme.command.c.bg = nil
    theme.visual.c.bg = nil
    theme.replace.c.bg = nil ]]
    lualine.setup({
        options = {
            theme = theme,
        }
    })

    local catppuccin = require('catppuccin')
    catppuccin.setup({
        transparent_background = true,
        highlight_overrides = {
            all = function(colors)
                return {
                    CmpBorder = { fg = "#ff0000" },
                }
            end,
        },
        custom_highlights = function(colors)
            return {
                Comment = { fg = colors.flamingo },
                TabLineSel = { bg = colors.pink },
                CmpBorder = { fg = colors.mauve },
                Pmenu = { bg = colors.none },
            }
        end,
        color_overrides = {
            all = {
                mauve = "#ff0000",
            },
        },
        integrations = {
            cmp = true,
            treesitter = false,
            telescope = {
                enabled = true,
                style = 'nvchad'
            },
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { "italic" },
                    hints = { "italic" },
                    warnings = { "italic" },
                    information = { "italic" },
                    ok = { "italic" },
                },
                underlines = {
                    errors = { "underline" },
                    hints = { "underline" },
                    warnings = { "underline" },
                    information = { "underline" },
                    ok = { "underline" },
                },
                inlay_hints = {
                    background = true,
                },
        },
        },
    })
    vim.cmd('colorscheme catppuccin-mocha')
end

return {
    enabled = false,
    "catppuccin/nvim",
    dependencies = { 'nvim-lualine/lualine.nvim', },
    lazy = false,
    priority = 1000,
    opts = {},
    config = config,
}
