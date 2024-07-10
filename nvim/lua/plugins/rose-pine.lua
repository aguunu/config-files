local config = function()
    require('rose-pine').setup({
        extend_background_behind_borders = false,
        styles = {
            bold = true,
            italic = true,
            transparency = true,
        },
        -- groups = {
        --     border = "muted",
        -- },
        highlight_groups = {
            -- :lua require('telescope.builtin').highlights()
            -- telescope highlights
            TelescopeBorder = { fg = "highlight_high", bg = "none" },
            TelescopeNormal = { bg = "none" },
            TelescopePromptNormal = { bg = "none" },
            TelescopeResultsNormal = { fg = "subtle", bg = "none" },
            TelescopeSelection = { fg = "text", bg = "highlight_med" },
--[[             TelescopeSelectionCaret = { fg = "highlight_med", bg = "highlight_med" }, ]]
            TelescopeMatching = { fg = "foam" },
            -- cmp highlights
            CmpBorder = { fg = "none", bg = "subtle" },
            CmpFloatBorder = { fg = "none", bg = "subtle" },
            CmpNormal = { fg = "text", bg = "surface" },
            CmpDocNormal = { fg = "text", bg = "surface" },
            -- floating window highlights
            NormalFloat = { fg = "text", bg = "surface" },
            FloatBorder = { fg = "none", bg = "surface" },
        },
    })

    local lualine = require('lualine')
    local theme = require('lualine.themes.rose-pine')
    -- set transparent background
    --[[ theme.normal.c.bg = nil
    theme.insert.c.bg = nil
    theme.command.c.bg = nil
    theme.visual.c.bg = nil
    theme.replace.c.bg = nil ]]
    lualine.setup({
        options = {
            theme = theme,
        }
    })
    vim.opt.laststatus = 2 -- Or 3 for global statusline
    vim.opt.statusline = " %f %m %= %l:%c ♥ "


    vim.cmd('colorscheme rose-pine')
end

return {
    enabled = true,
    "rose-pine/neovim",
    dependencies = { 'nvim-lualine/lualine.nvim', },
    lazy = false,
    priority = 1000,
    opts = {},
    config = config,
}
