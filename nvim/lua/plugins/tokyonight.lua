local config = function()
    local tokyonight = require('tokyonight')

    tokyonight.setup({
        transparent = true,
        on_colors = function(colors)
            colors.hint = colors.purple
            colors.error = colors.red
        end,
        on_highlights = function(hl, colors)
            hl.TelescopeNormal = { bg = colors.none }
            hl.TelescopeBorder = { bg = colors.none }
            hl.TelescopePromptNormal = { bg = colors.none }
            hl.TelescopePromptBorder = { bg = colors.none }
            hl.TelescopePromptTitle = { bg = colors.none }
            hl.TelescopeResultsNormal = { bg = colors.none }
            -- TelescopeSelection = { fg = "text", bg = "highlight_med" }
            -- TelescopeSelectionCaret = { fg = "highlight_med", bg = "highlight_med" }
            -- TelescopeMatching = { fg = "foam" }
        end,
    })

    -- configure lualine colors
    local lualine = require('lualine')
    local theme = require('lualine.themes.tokyonight')
    -- local colors = require('tokyonight.colors').setup({})
    
    -- set transparent background
    theme.normal.c.bg = nil
    theme.normal.b.bg = nil
    theme.insert.b.bg = nil
    theme.visual.b.bg = nil
    theme.command.b.bg = nil
    theme.replace.b.bg = nil
    theme.terminal.b.bg = nil
    lualine.setup({
        options = {
            theme = theme,
        }
    })
    -- set colorscheme
    vim.cmd('colorscheme tokyonight')
end


return {
    enabled = false,
    "folke/tokyonight.nvim",
    dependencies = { 'nvim-lualine/lualine.nvim' },
    lazy = false,
    priority = 1000,
    opts = {},
    config = config,
}
