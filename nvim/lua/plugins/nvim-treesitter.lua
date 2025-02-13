local config = function()
    require('nvim-treesitter.configs').setup({
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
        indent = {
            enable = true,
        },
        autotag = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<leader>k',
                node_incremental = '<leader>k',
                scope_incremental = false,
                node_decremental = '<leader>j',
            },
        },
        ensure_installed = {
            "markdown",
            "lua",
            "python",
            "c",
            "cpp",
            "go",
            "html",
            "java",
            "javascript",
            "rust",
            "latex",
            "tsx",
            "typescript",
            "json",
            "ruby",
        },
        textobjects = {
            select = {

                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ic"] = "@class.inner",
                    ["ac"] = "@class.outer",
                    ["ib"] = "@block.inner",
                    ["ab"] = "@block.outer",
                },
            },
        },
    })
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        event = { "BufReadPre", "BufNewFile" },
        config = config,
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects' }
}
