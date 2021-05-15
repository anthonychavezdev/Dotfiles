_G.expandSnippet = function()
 vim.api.nvim_exec([['vsnip-expandable() ? <Plug>(vsnip-expand)']], false)
end

vim.api.nvim_set_keymap("i", "<c-j>", 'v:lua.expandSnippet()',
                                      {expr = true})
