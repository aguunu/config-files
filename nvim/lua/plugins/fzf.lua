local config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
        winopts = {
            border = "single",
            preview = {
                border = "single",
            },
        },
        defaults = {
            color_icons = false,
        },
    })

    vim.cmd(":FzfLua register_ui_select")

    local cfg = require("fzf-lua.config")
    vim.keymap.set('n', '<C-e>', function() fzf.files(cfg) end, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>ff', function() fzf.files(cfg) end, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', function() fzf.live_grep(cfg) end, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>ft', function() fzf.treesitter(cfg) end, { desc = 'Find Treesitter' })
    vim.keymap.set('n', '<leader>fb', function() fzf.buffers(cfg) end, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fr', function() fzf.buffers(cfg) end, { desc = 'Find Registers' })
    vim.keymap.set('n', '<leader>fq', function() fzf.builtin(cfg) end, { desc = 'Find Builtin' })
    vim.keymap.set('n', '<leader>ds', function() fzf.diagnostics_workspace(cfg) end, { desc = 'Workspace Diagnostics' })
end

return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    config = config,
}
