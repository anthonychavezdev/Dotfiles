-- This isn't working for some reason?

vim.cmd('hi Pmenu ctermbg=Black')
vim.cmd('hi Pmenu ctermfg=White')
vim.cmd('hi PmenuSel ctermbg=Black')
vim.cmd('hi PmenuSel ctermfg=Red')

-- Same colors for gui or when termguicolors is enabled
vim.cmd('hi Pmenu guibg=Black')
vim.cmd('hi Pmenu guifg=White')
vim.cmd('hi PmenuSel guibg=Black')
vim.cmd('hi PmenuSel guifg=Red')
