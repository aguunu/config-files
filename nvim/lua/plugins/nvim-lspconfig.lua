local config = function()
    local lspconfig = require('lspconfig')
    -- lspconfig.lua_ls.setup({})
    -- lspconfig.pyright.setup({})
    -- lspconfig.rust_analyzer.setup({})
    -- lspconfig.texlab.setup({})
    -- lspconfig.clangd.setup({})
    -- lspconfig.ruff.setup({})
    -- lspconfig.jdtls.setup({})
    -- lspconfig.ts_ls.setup({})
    -- lspconfig.jsonls.setup({})
    -- lspconfig.eslint.setup({})
    -- lspconfig.harper_ls.setup({
    --     codeActions = {
    --         forceStable = true,
    --     }
    -- })

    local border = 'single'

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border
    })

    vim.diagnostic.config({
        underline = true,
        severity_sort = true,
        update_in_insert = false,
        virtual_text = {
            source = "always", -- Or "if_many"
            prefix = '■', -- Could be '', '▎', 'x'
        },
        float = {
            source = "always", -- Or "if_many"
            border = border,
            header = '',
        },
    })
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- 'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason-lspconfig',
        'williamboman/mason.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile', },
    config = config,
    opts = {
        inlay_hints = { enabled = true },
    },
}
