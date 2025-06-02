return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                -- watch_gitdir = {
                --     interval = 1000, -- Check for changes every second
                --     follow_files = true
                -- },
            })
        end
    },
    {
        'tpope/vim-fugitive',
    },
    {
        'akinsho/git-conflict.nvim',
        version = "*",
        config = true,
    }
}
