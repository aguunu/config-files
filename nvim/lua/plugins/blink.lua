return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        signature = { enabled = true },
        cmdline = {
            keymap = { preset = 'inherit' },
            completion = { menu = { auto_show = true } },
        },

        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            ["<C-k>"] = { function(cmp) cmp.select_prev({ auto_insert = false, on_ghost_text = true }) end }, --{'select_prev', 'fallback'},
            ["<C-j>"] = { function(cmp) cmp.select_next({ auto_insert = false, on_ghost_text = true }) end }, --{'select_next', 'fallback'},
            ["<Tab>"] = { 'accept', 'fallback' },
            ["<S-k>"] = { function(cmp) cmp.scroll_documentation_up(2) end },
            ["<S-j>"] = { function(cmp) cmp.scroll_documentation_down(2) end },
            -- ["<CR>"] = {'confirm', 'select'},
            -- ["<S-Tab>"] = function(cmp) cmp.scroll_documentation_up(2) end,
            -- ["<Tab>"] = function(cmp) cmp.scroll_documentation_down(2) end,
            -- ["<CR>"] = cmp.mapping.confirm({
            --     select = true,
            --     behavior = cmp.ConfirmBehavior.Replace
            -- }),
            -- ["<S-Tab>"] = cmp.mapping.scroll_docs(-2),
            -- ["<Tab>"] = cmp.mapping.scroll_docs(2),
            -- ["<S-k>"] = cmp.mapping.scroll_docs(-2),
            -- ["<S-j>"] = cmp.mapping.scroll_docs(2),
        },

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono'
        },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = { border = "", winhighlight = "Normal:BlinkCmpDocNormal" }
            },
            menu = {
                winhighlight = "Normal:BlinkCmpNormal",
                draw = { gap = 1, padding = 1 }
            },
            ghost_text = {enabled=true, show_with_menu = true}
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }

}
