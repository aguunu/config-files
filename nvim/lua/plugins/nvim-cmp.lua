-- :help cmp
local config = function()
    local cmp = require("cmp")

    cmp.setup({
        view = {
            entries = {
                name = 'custom',
                selection_order = 'near_cursor',
                autocomplete = true,
                -- follow_cursor = true,
            }
        },
        completion = {
            -- completeopt = "menu,menuone,preview,fuzzy",
            completeopt = "menuone,popup,fuzzy"
            -- placeholder = true,
        },
        mapping = cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_prev_item(),
            ["<C-j>"] = cmp.mapping.select_next_item(),
            -- ["<C-a>"] = cmp.mapping.close(),
            -- ["<Tab>"] = cmp.mapping.confirm({
            --     select = true,
            --     behavior = cmp.ConfirmBehavior.Replace
            -- }),
            ["<CR>"] = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Replace
            }),
            ["<S-Tab>"] = cmp.mapping.scroll_docs(-2),
            ["<Tab>"] = cmp.mapping.scroll_docs(2),
            ["<S-k>"] = cmp.mapping.scroll_docs(-2),
            ["<S-j>"] = cmp.mapping.scroll_docs(2),
        }),
        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "nvim_lsp_signature_help" },
            -- { name = "buffer" },
        }),
        window = {
            completion = {
                -- border = "single",
                winhighlight = "Normal:CmpNormal",
            },
            documentation = {
                -- border = "single",
                winhighlight = "Normal:CmpDocNormal",
            },
        },
    })

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            {
                name = 'cmdline',
                option = {
                    ignore_cmds = { 'Man', '!' }
                }
            }
        })
    })
end

return {
    enabled = false,
    "hrsh7th/nvim-cmp",
    event = {"InsertEnter", "CmdlineEnter"},
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "hrsh7th/cmp-cmdline",
    },
    config = config,
}
