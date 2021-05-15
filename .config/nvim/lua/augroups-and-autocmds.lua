-- Set vim to save the file on focus out.
vim.cmd("au FocusLost * :wa")

-- Redraw screen every time when focus gained
vim.cmd("au FocusGained * :redraw!")
-- Working with split screen nicely
-- Resize Split When the window is resized"
vim.cmd("au VimResized * :wincmd =")

-- Reload init.lua
-- vim.cmd("autocmd bufwritepost ~/.config/nvim/init.lua source $MYVIMRC")


-- Compiling and/or running
vim.cmd([[autocmd Filetype rmd command! Compile :silent exec"!echo<space>\"require('rmarkdown');<space>render('%','pdf_document')\"<space>|<space>R<space>--vanilla > /tmp/rmarkdown.output && ~/scripts/Launch_MuPDF.sh %:r.pdf &"]])
vim.cmd('autocmd Filetype c command! Compile !gcc "%" -o %:r')
vim.cmd('autocmd Filetype cpp command! Compile !g++ "%" -o %:r')
vim.cmd('autocmd Filetype tex command! Pdf !zathura "%" %:r.pdf')
vim.cmd('autocmd Filetype kotlin comman! Compile !kotlinc -include-runtime "%" -d %:r.jar')

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


-- Spell checking
vim.cmd('autocmd FileType tex,gitcommit,text,markdown setlocal spell')

-- For IBM Assembler

vim.cmd([[augroup hlasmdetect
    au! BufRead,BufNewFile *.jcl set filetype=hlasm
augroup END]])


-- When a terminal is open, put Neovim in insert mode
-- right away.
vim.cmd('autocmd TermOpen term://* startinsert')
-- Turn off line numbers
vim.cmd('autocmd TermOpen term://* setlocal norelativenumber')
vim.cmd('autocmd TermOpen term://* setlocal nonumber')
