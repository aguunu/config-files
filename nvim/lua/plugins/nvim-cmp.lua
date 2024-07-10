-- :help cmp
local config = function()
    local cmp = require("cmp")
    cmp.setup({
        view = {
            entries = {
                name = 'custom',
                selection_order = 'top_down',
                follow_cursor = true,
            }
        },
        completion = {
            completeopt = "menu,menuone,preview,fuzzy",
            -- placeholder = true,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            ["<C-a"] = cmp.mapping.close(),
            ["<Tab>"] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }),
            ["<CR>"] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }),
            ["<S-k>"] = cmp.mapping.scroll_docs(-2),
            ["<S-j>"] = cmp.mapping.scroll_docs(2),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "nvim_lsp_signature_help" },
            { name = "buffer" },
        }),
        window = {
            completion = {
                -- border = "rounded",
                winhighlight = "Normal:CmpNormal",
            },
            documentation = {
                -- border = "rounded",
                winhighlight = "Normal:CmpDocNormal",
            },
        },
    })
end

return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help"
    },
    config = config,
}
