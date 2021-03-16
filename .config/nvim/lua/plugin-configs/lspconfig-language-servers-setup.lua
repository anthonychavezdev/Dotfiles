local lspc = require'lspconfig'
    lspc.clangd.setup {
    on_attatch = on_attatch,
    init_options = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" }
    }
}
require'lspconfig'.pyright.setup{}
