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
    if errors > 0 then status = status .. "  " .. errors end
    if warnings > 0 then status = status .. "  " .. warnings end
    if info > 0 then status = status .. "  " .. info end

    if hints > 0 then status = status .. "  " .. hints end

    _G.cached_lsp_diagnostics = status
end

-- Function to update git branch only when needed
_G.update_git_branch = function()
    local branch = vim.fn.FugitiveHead()
    if branch == "" then
        _G.cached_git_branch = ""

        return
    end

    -- Check for uncommitted changes
    local git_status = vim.fn.systemlist("git status --porcelain")

    local is_dirty = #git_status > 0

    _G.cached_git_branch = "on " .. branch .. (is_dirty and "*" or "")
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

-- Auto-update Git branch when entering a buffer
vim.api.nvim_create_autocmd(
    { "BufEnter", "FocusGained", "ShellCmdPost", "FileChangedShellPost", "FileWritePost", "BufWritePost", "DirChanged" },
    {
        callback = function() _G.update_git_branch() end
    })

local timer = vim.loop.new_timer()
timer:start(0, 1000, vim.schedule_wrap(function()
    _G.update_git_branch()
end))

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
