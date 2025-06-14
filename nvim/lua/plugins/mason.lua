return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')

        mason.setup({
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗'
                },
                border = "single",
            }
        })

        mason_lspconfig.setup({
            ensure_installed = {
                'lua_ls',
                "pyright",
                "rust_analyzer",
                "texlab",
                "clangd",
                "ruff",
                "jdtls",
                "ts_ls",
                "jsonls",
                "eslint",
            }
        })
    end
}
