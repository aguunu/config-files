local config = function()
    local fzf = require("fzf-lua")

    vim.cmd(":FzfLua register_ui_select")

    vim.keymap.set('n', '<C-e>', function() fzf.files() end, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>ff', function() fzf.files() end, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', function() fzf.live_grep() end, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>ft', function() fzf.treesitter() end, { desc = 'Find Treesitter' })
    vim.keymap.set('n', '<leader>fb', function() fzf.buffers() end, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fr', function() fzf.buffers() end, { desc = 'Find Registers' })
    vim.keymap.set('n', '<leader>fq', function() fzf.builtin() end, { desc = 'Find Builtin' })
    vim.keymap.set('n', '<leader>ds', function() fzf.diagnostics_workspace() end, { desc = 'Workspace Diagnostics' })
end

return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    config = config,
    opts = {
        files = {
            color_icons = false,
        }
    }
}
