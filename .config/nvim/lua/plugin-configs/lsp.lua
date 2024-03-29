function on_attach(client)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}

    buf_set_keymap('n', 'gD', [[<cmd>lua vim.lsp.buf.declaration()<CR>]], opts)
    buf_set_keymap('n', 'gd', [[<cmd>lua vim.lsp.buf.definition()<CR>]], opts)
    buf_set_keymap('n', 'gr', [[<cmd>lua vim.lsp.buf.references()<CR>]], opts)
    buf_set_keymap('n', 'gi', [[<cmd>lua vim.lsp.buf.implementation()<CR>]], opts)
    buf_set_keymap('n', '[g', [[<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>]], opts)
    buf_set_keymap('n', ']g', [[<cmd>lua vim.lsp.diagnostic.goto_next()<CR>]], opts)
    buf_set_keymap('n', 'K', [[<cmd>lua vim.lsp.buf.hover()<CR>]], opts)
    buf_set_keymap('n', '<C-k', [[<cmd>lua vim.lsp.buf.signature_help()<CR>]], opts)
    buf_set_keymap('n', '<leader>rn', [[<cmd>lua vim.lsp.buf.rename()<CR>]], opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end
end

local lspconf = require("lspconfig")

-- these langs require same lspconfig so put em all in a table and loop through!
local servers = {"html", "cssls", "tsserver", "pyright", "bashls", "clangd", "rls"}

for _, lang in ipairs(servers) do
    lspconf[lang].setup {
        on_attach = on_attach,
        root_dir = vim.loop.cwd,
        capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
end

-- vls conf example
-- local vls_binary = "/usr/local/bin/vls"
-- lspconf.vls.setup {
--     cmd = {vls_binary}
-- }

-- lua lsp settings
USER = "/home/" .. vim.fn.expand("$USER")

local sumneko_root_path = USER .. "/.local/bin/sumneko"
local sumneko_binary = USER .. "/.local/bin/sumneko/lua-language-server"


lspconf.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    root_dir = function()
        return vim.loop.cwd()
    end,
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";")
            },
            diagnostics = {
                globals = {"vim"}
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true
                }
            },
            telemetry = {
                enable = false
            }
        }
    }
}

-- replace the default lsp diagnostic letters with prettier symbols
vim.fn.sign_define("LspDiagnosticsSignError", {text = "", numhl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = "", numhl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = "", numhl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "", numhl = "LspDiagnosticsDefaultHint"})


-- auto-format
-- as of 2021-03-15
-- augroups and autocommands do not have an interface yet but it is being worked on
-- See: https://github.com/neovim/neovim/pull/12378
vim.cmd('autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)')
vim.cmd('autocmd BufWritePre *.rs lua vim.lsp.buf.formatting_sync(nil, 100)')
