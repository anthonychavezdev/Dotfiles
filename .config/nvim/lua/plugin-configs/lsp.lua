-- LSP config (the mappings used in the default file don't quite work right)
local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
local cmd = vim.api.nvim_command
map('n', 'gd', [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
map('n', 'gD', [[<cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
map('n', 'gr', [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)
map('n', 'gi', [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
map('n', 'K', [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)
map('n', '<C-k', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
map('n', '[g', [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], opts)
map('n', ']g', [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], opts)

-- auto-format
-- as of 2021-03-15
-- augroups and autocommands do not have an interface yet but it is being worked on
-- See: https://github.com/neovim/neovim/pull/12378
cmd('autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)')
cmd('autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)')
