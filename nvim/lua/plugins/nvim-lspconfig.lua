local config = function()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup({})
    lspconfig.pyright.setup({})
    lspconfig.rust_analyzer.setup({})
    lspconfig.texlab.setup({})
    lspconfig.clangd.setup({})

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    --     border = 'rounded'
    -- })
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
