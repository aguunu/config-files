local config = function()
    local noirbuddy_lualine = require('noirbuddy.plugins.lualine')

    require('lualine').setup {
    options = {
        theme = noirbuddy_lualine.theme,
      },
      sections = noirbuddy_lualine.sections,
      inactive_sections = noirbuddy_lualine.inactive_sections,
    }
end

return {
    enabled = false,
    'jesseleite/nvim-noirbuddy',
    dependencies = {
        { 'tjdevries/colorbuddy.nvim', 'nvim-lualine/lualine.nvim' }
    },
    lazy = false,
    priority = 1000,
    opts = {
        preset = 'minimal',
    },
}
