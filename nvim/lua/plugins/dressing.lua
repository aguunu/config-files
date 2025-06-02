return {
    'stevearc/dressing.nvim',
    enabled = false,
    opts = {
        select = {
            -- Priority list of preferred vim.select implementations
            -- backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
            backend = "fzf_lua"
        }
    },
}
