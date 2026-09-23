-- Cached diagnostic status
_G.cached_lsp_diagnostics = ""
_G.cached_git_branch = ""

-- Function to update diagnostics only when needed
_G.update_lsp_diagnostics = function()
    local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
    local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
    local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

    local status = ""
    if errors > 0 then status = status .. "  " .. errors end
    if warnings > 0 then status = status .. "  " .. warnings end
    if info > 0 then status = status .. "  " .. info end

    if hints > 0 then status = status .. "  " .. hints end

    _G.cached_lsp_diagnostics = status
end

-- Working tree state per git root, resolved off the main loop so that redrawing
-- the statusline never waits on a git subprocess.
local dirty_by_root = {}
local pending_by_root = {}

local function refresh_dirty()
    local status = vim.b.gitsigns_status_dict
    local root = status and status.root

    if not root or pending_by_root[root] then
        return
    end

    pending_by_root[root] = true

    vim.system({ "git", "status", "--porcelain" }, { cwd = root, text = true }, function(result)
        vim.schedule(function()
            pending_by_root[root] = nil
            dirty_by_root[root] = result.code == 0 and result.stdout ~= ""

            _G.update_git_branch()
            vim.cmd("redrawstatus")
        end)
    end)
end

-- Branch name comes from gitsigns, which already tracks it per buffer
_G.update_git_branch = function()
    local status = vim.b.gitsigns_status_dict

    if not status or not status.head or status.head == "" then
        _G.cached_git_branch = ""

        return
    end

    if dirty_by_root[status.root] == nil then
        refresh_dirty()
    end

    _G.cached_git_branch = "on " .. status.head .. (dirty_by_root[status.root] and "*" or "")
end

-- Functions to return cached values for statusline
_G.get_lsp_diagnostics = function()
    return _G.cached_lsp_diagnostics
end

_G.get_git_branch = function()
    return _G.cached_git_branch
end


-- Auto-update LSP diagnostics when diagnostics change

vim.api.nvim_create_autocmd({ "DiagnosticChanged" }, {
    callback = function() _G.update_lsp_diagnostics() end
})

vim.api.nvim_create_autocmd({ "BufEnter", "DirChanged" }, {
    callback = function() _G.update_git_branch() end
})

vim.api.nvim_create_autocmd("User", {
    pattern = { "GitSignsUpdate", "GitSignsChanged" },
    callback = function() _G.update_git_branch() end
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufWritePost", "DirChanged" }, {
    callback = function() refresh_dirty() end
})

vim.api.nvim_create_autocmd("User", {
    pattern = "GitSignsChanged",
    callback = function() refresh_dirty() end
})

-- Set statusline
vim.o.statusline = table.concat({
    "%#StatusLine#",                       -- Highlight
    " %t",                                 -- File name
    "%m",                                  -- Modified flag
    "%r",                                  -- Read-only flag
    "%w",                                  -- Preview flag
    " %{v:lua.get_git_branch()}",          -- Cached Git branch (function call)
    "%=",                                  -- Align right
    " %{v:lua.get_lsp_diagnostics()}",     -- Cached LSP diagnostics (function call)
    " %p%%",                               -- File position
    " %l:%c "                              -- Line and column
})
