-- vim.cmd('let g:netrw_liststyle = 3')
vim.cmd('au TextYankPost * silent! lua vim.highlight.on_yank()')

-- don't give the intro message when starting Vim
vim.opt.shortmess:append({ I = true })

local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
-- opt.smartcase = true
-- opt.hlsearch = false

-- Appearance
opt.number = true
opt.relativenumber = false
opt.termguicolors = true
-- opt.colorcolumn = '100'
opt.signcolumn = 'yes'
-- opt.cmdheight = 1
opt.scrolloff = 10
-- opt.completeopt = 'menuone,noinsert,noselect'

-- Behavior
-- opt.hidden = true
-- opt.errorbells = false
-- opt.swapfile = false
-- opt.backup = false
opt.encoding = 'UTF-8'

-- opt.foldenable = false
-- opt.foldmethod = 'expr'
-- opt.foldexpr = 'nvim_treesitter#foldexpr()'

