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
            -- telescope
            -- TelescopeBorder = { fg = "highlight_high", bg = "none" },
            -- TelescopeNormal = { bg = "none" },
            -- TelescopePromptNormal = { bg = "none" },
            -- TelescopeResultsNormal = { fg = "subtle", bg = "none" },
            -- TelescopeSelection = { fg = "text", bg = "highlight_med" },
            -- TelescopeMatching = { fg = "foam" },
            -- cmp
            CmpBorder = { fg = "none", bg = "subtle" },
            CmpFloatBorder = { fg = "none", bg = "subtle" },
            CmpNormal = { fg = "text", bg = "surface" },
            CmpDocNormal = { fg = "text", bg = "surface" },
            -- blink
            BlinkCmpBorder = { fg = "none", bg = "subtle" },
            BlinkCmpFloatBorder = { fg = "none", bg = "subtle" },
            BlinkCmpNormal = { fg = "text", bg = "surface" },
            BlinkCmpDocNormal = { fg = "text", bg = "surface" },
            -- floating window highlights
            -- NormalFloat = { fg = "text", bg = "surface" },
            -- FloatBorder = { fg = "none", bg = "surface" },
            -- fzf
            FzfLuaHeaderText = { fg = "iris" },
            FzfLuaLivePrompt = { fg = "iris" },
            -- statusline
            -- StatusLine = { fg = "muted", bg = "surface" },
            StatusLine = { fg = "iris", bg = "iris", blend = 10 },
            StatusLineNC = { fg = "subtle", bg = "surface" }
        },
    })

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
