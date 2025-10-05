return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup({
                -- watch_gitdir = {
                --     interval = 1000, -- Check for changes every second
                --     follow_files = true
                -- },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', '<leader>gn', gs.next_hunk, { desc = 'Next hunk' })
                    map('n', '<leader>gp', gs.prev_hunk, { desc = 'Previous hunk' })

                    -- Actions
                    map('n', '<leader>gs', gs.stage_hunk, { desc = 'Stage hunk' })
                    map('n', '<leader>gr', gs.reset_hunk, { desc = 'Reset hunk' })
                    map('n', '<leader>gu', gs.undo_stage_hunk, { desc = 'Undo stage hunk' })
                    map('n', '<leader>gS', gs.stage_buffer, { desc = 'Stage buffer' })
                    map('n', '<leader>gR', gs.reset_buffer, { desc = 'Reset buffer' })

                    -- Preview and blame
                    map('n', '<leader>gh', gs.preview_hunk_inline, { desc = 'Preview hunk' })
                    map('n', '<leader>gb', gs.blame_line, { desc = 'Blame line' })
                    -- map('n', '<leader>gd', gs.diffthis, { desc = 'Diff this' })
                end,
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
