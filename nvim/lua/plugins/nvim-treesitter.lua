local ensure_installed = {
    "markdown",
    "markdown_inline",
    "lua",
    "python",
    "c",
    "cpp",
    "go",
    "html",
    "java",
    "javascript",
    "rust",
    "tsx",
    "typescript",
    "json",
    "ruby",
}

-- The main branch ships queries and a parser installer only. Highlighting and
-- indentation come from Neovim itself and are enabled per buffer.
local function enable_treesitter(buf)
    if not vim.api.nvim_buf_is_valid(buf) then
        return
    end

    if not pcall(vim.treesitter.start, buf) then
        return
    end

    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

-- Replaces the incremental_selection module, which main does not carry over.
local selection_stacks = {}

local function is_before(row_a, col_a, row_b, col_b)
    return row_a < row_b or (row_a == row_b and col_a < col_b)
end

local function visual_range()
    local anchor = vim.fn.getpos('v')
    local cursor = vim.fn.getpos('.')
    local srow, scol = anchor[2] - 1, anchor[3] - 1
    local erow, ecol = cursor[2] - 1, cursor[3] - 1

    if is_before(erow, ecol, srow, scol) then
        srow, scol, erow, ecol = erow, ecol, srow, scol
    end

    return srow, scol, erow, ecol + 1
end

local function select_range(srow, scol, erow, ecol)
    if ecol == 0 and erow > srow then
        erow = erow - 1
        ecol = #(vim.api.nvim_buf_get_lines(0, erow, erow + 1, false)[1] or '')
    end

    -- `v` toggles visual mode off when one is already active, so always start
    -- the new selection from normal mode.
    if vim.fn.mode() ~= 'n' then
        vim.cmd('normal! ' .. vim.api.nvim_replace_termcodes('<Esc>', true, false, true))
    end

    vim.api.nvim_win_set_cursor(0, { srow + 1, scol })
    vim.cmd('normal! v')
    vim.api.nvim_win_set_cursor(0, { erow + 1, math.max(ecol - 1, 0) })
end

local function grow_selection()
    local buf = vim.api.nvim_get_current_buf()
    local mode = vim.fn.mode()
    local node

    if mode == 'v' or mode == 'V' then
        local srow, scol, erow, ecol = visual_range()
        node = vim.treesitter.get_node({ bufnr = buf, pos = { srow, scol } })

        while node do
            local nsrow, nscol, nerow, necol = node:range()

            if is_before(nsrow, nscol, srow, scol) or is_before(erow, ecol, nerow, necol) then
                break
            end

            node = node:parent()
        end
    else
        selection_stacks[buf] = {}
        node = vim.treesitter.get_node({ bufnr = buf })
    end

    if not node then
        return
    end

    local stack = selection_stacks[buf] or {}
    stack[#stack + 1] = { node:range() }
    selection_stacks[buf] = stack

    select_range(node:range())
end

local function shrink_selection()
    local stack = selection_stacks[vim.api.nvim_get_current_buf()]

    if not stack or #stack < 2 then
        return
    end

    table.remove(stack)
    select_range(unpack(stack[#stack]))
end

local config = function()
    local ts = require('nvim-treesitter')

    ts.setup()
    ts.install(ensure_installed)

    local available

    vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
            local lang = vim.treesitter.language.get_lang(args.match)

            if not lang then
                return
            end

            if vim.tbl_contains(ts.get_installed('parsers'), lang) then
                enable_treesitter(args.buf)

                return
            end

            available = available or ts.get_available()

            if vim.tbl_contains(available, lang) then
                ts.install({ lang }):await(function()
                    vim.schedule(function() enable_treesitter(args.buf) end)
                end)
            end
        end,
    })

    vim.keymap.set({ 'n', 'x' }, '<leader>k', grow_selection, { desc = 'Expand selection' })
    vim.keymap.set('x', '<leader>j', shrink_selection, { desc = 'Shrink selection' })
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        config = config,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
    },
}
