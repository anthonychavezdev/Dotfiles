-- Set vim to save the file on focus out.
vim.api.nvim_exec("au FocusLost * :wa", false)

-- Redraw screen every time when focus gained
vim.api.nvim_exec("au FocusGained * :redraw!", false)
-- Working with split screen nicely
-- Resize Split When the window is resized"
vim.api.nvim_exec("au VimResized * :wincmd =", false)

-- Reload init.lua
-- vim.cmd("autocmd bufwritepost ~/.config/nvim/init.lua source $MYVIMRC")


-- Compiling and/or running
vim.api.nvim_exec([[autocmd Filetype rmd command! Compile :silent exec"!echo<space>\"require('rmarkdown');<space>render('%','pdf_document')\"<space>|<space>R<space>--vanilla > /tmp/rmarkdown.output && ~/scripts/Launch_MuPDF.sh %:r.pdf &"]], false)
vim.api.nvim_exec('autocmd Filetype c command! Compile !gcc "%" -o %:r', false)
vim.api.nvim_exec('autocmd Filetype cpp command! Compile !g++ "%" -o %:r', false)
vim.api.nvim_exec('autocmd Filetype tex command! Pdf !zathura "%" %:r.pdf', false)
vim.api.nvim_exec('autocmd Filetype kotlin comman! Compile !kotlinc -include-runtime "%" -d %:r.jar', false)

-- Make Sure that Vim returns to the same line when we reopen a file"
-- vim.cmd([[
-- augroup line_return
--     au!
--     au BufReadPost *
--                 \ if line("'\"") > 0 && line("'\"") <= line("$") |
--                 \ execute 'normal! g`"zvzz' |
--                 \ endif
-- augroup END
-- ]])

_G._autocommands = {}
_G._autocommands.line_return = function()
    local line = vim.fn.line
    if line("'\"") > 0 and line("'\"") <= line("$") then
        vim.cmd("normal! g`\"zvzz'")
    end
end

vim.api.nvim_exec([[
augroup line_return
    au!
    au BufReadPost * lua _autocommands.line_return()
augroup END
]], false)

-- Spell checking
vim.api.nvim_exec('autocmd FileType tex,gitcommit,text,markdown setlocal spell', false)

-- For IBM Assembler

vim.api.nvim_exec([[augroup hlasmdetect
    au! BufRead,BufNewFile *.jcl set filetype=hlasm
augroup END]], false)


-- When a terminal is open, put Neovim in insert mode
-- right away.
vim.api.nvim_exec('autocmd TermOpen term://* startinsert', false)
-- Turn off line numbers
vim.api.nvim_exec('autocmd TermOpen term://* setlocal norelativenumber', false)
vim.api.nvim_exec('autocmd TermOpen term://* setlocal nonumber', false)
