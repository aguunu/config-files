vim.g.mapleader = " "

-- disable auto-comments on new line
vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')

local keymap = vim.keymap

keymap.set("n", "<leader>pp", vim.cmd.Ex)

--[[ -- indentation
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv') ]]

-- redo
keymap.set('n', 'U', '<C-r>', { noremap = true})

-- window managment
keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split window vertically' })
keymap.set('n', '<leader>wh', '<C-w>s', { desc = 'Split window horizontally' })
keymap.set('n', '<leader>wx', '<C-w>q', { desc = 'Quit a window' })
keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Switch windows' })

-- tab managment
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab


-- diagnostics
keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Open diagnostic float'})

-- lsp
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions', noremap = true, silent = true })
keymap.set('n', '<leader>cd', vim.lsp.buf.definition, { desc = 'Go to definition' })
keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
keymap.set('n', '<leader>cf', vim.lsp.buf.format, { desc = 'Format All' })
keymap.set('v', '<leader>cf', vim.lsp.buf.format, { desc = 'Format Selection' })
keymap.set('n', '<leader>cg', vim.lsp.buf.references, { desc = 'Go to references' })
keymap.set('n', '<leader>cc', vim.lsp.buf.hover, { desc = 'Hover' })
keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, { desc = 'Signature help' })
keymap.set('n', '<leader>ch', vim.lsp.buf.document_highlight, { desc = 'Document highlight' })
keymap.set('n', '<leader>cr', vim.lsp.buf.rename, { desc = 'Rename references' })
keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition, { desc = 'Type definition' })
