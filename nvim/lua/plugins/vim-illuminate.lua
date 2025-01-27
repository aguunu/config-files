return {
    'RRethy/vim-illuminate',
    enabled = false,
    lazy = false,
    config = function()
        require('illuminate').configure({})
    end
}
