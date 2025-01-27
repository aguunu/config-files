local config = function()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.rust_analyzer.setup({})
    lspconfig.texlab.setup({})
    lspconfig.clangd.setup({})
    lspconfig.ruff.setup({})
    lspconfig.jdtls.setup({})
    lspconfig.ts_ls.setup({})
    -- lspconfig.harper_ls.setup({
    --     codeActions = {
    --         forceStable = true,
    --     }
    -- })

    local border = 'single'

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = border
    })

    -- Add border to the diagnostic popup window
    vim.diagnostic.config({
        -- virtual_text = {
        --     prefix = '■ ', -- Could be '●', '▎', 'x', '■', , 
        -- },
        float = { border = border },
    })
end

return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'williamboman/mason-lspconfig',
        'williamboman/mason.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile', },
    config = config,
    opts = {
        inlay_hints = { enabled = true },
    },
}
