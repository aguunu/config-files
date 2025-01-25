-- :help Telescope

local config = function()
    local telescope = require('telescope')
    local builtin = require('telescope.builtin')
    local actions = require('telescope.actions')

    vim.keymap.set('n', '<C-e>', function() builtin.find_files() end, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>ff', function() builtin.find_files() end, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', function() builtin.live_grep() end, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>ft', function() builtin.treesitter() end, { desc = 'Find Treesitter' })
    vim.keymap.set('n', '<leader>fb', function() builtin.builtin() end, { desc = 'Find Telescope Builtin' })
    vim.keymap.set('n', '<leader>ds', function() builtin.diagnostics() end, { desc = 'Search diagnostics' })
    telescope.setup({
        defaults = {
            --            path_display = { 'smart' },
            prompt_prefix = '> ',
            selection_caret = ' ',
            entry_prefix = ' ',
            sorting_strategy = 'descending',
            results_title = false,
            prompt_title = false,
            mappings = {
                i = {
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                },
            }
        },
    })
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    enabled = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = config,
}
