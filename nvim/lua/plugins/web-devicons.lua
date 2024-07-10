local config = function()
    require('nvim-web-devicons').setup({
        color_icons = false;
    })
end

return {
    'nvim-tree/nvim-web-devicons',
    config = config,
}
