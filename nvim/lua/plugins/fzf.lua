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

    vim.keymap.set('n', '<C-e>', fzf.files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Find Files' })
    vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = 'Live Grep' })
    vim.keymap.set('n', '<leader>ft', fzf.treesitter, { desc = 'Find Treesitter' })
    vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = 'Find Buffers' })
    vim.keymap.set('n', '<leader>fr', fzf.registers, { desc = 'Find Registers' })
    vim.keymap.set('n', '<leader>fq', fzf.builtin, { desc = 'Find Builtin' })
    vim.keymap.set('n', '<leader>ds', fzf.diagnostics_workspace, { desc = 'Workspace Diagnostics' })
end

return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    config = config,
}
