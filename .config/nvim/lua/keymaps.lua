local function map(mode, lhs, rhs, opts)
    local options = {noremap = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local opt = {}

-- Mappings for :terminal
-- <C-\><C-n> key stroke is used to switch to
-- nomral mode in the Neovim Terminal.
-- I want to just hit escape, or jk though.
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "jk", "<C-\\><C-n>", opt)

vim.g.mapleader = " "
vim.w.mapleader = " "

map("", "j", "gj")
map("", "k", "gk")


-- for creating and moving between tags.
map("n", "<leader>tn", ":tnext<CR>", opt)
map("n", "<leader>tp", ":tprev<CR>", opt)
map("n", "<leader>tj", ":tjump<CR>", opt)
map("n", "<leader>en", ":lnext<CR>", opt)
map("n", "<leader>ep", ":lprevious<CR>", opt)
map("n", "<leader>tb", ":TagbarToggle<CR>", opt)

-- For moving between buffers
map("n", "[b", ":BufferLineCyclePrev<CR>", {silent = true})
map("n", "]b", ":BufferLineCycleNext<CR>", {silent = true})


-- To quickly open a terminal split
map("n", "<leader>T", ":8sp term://$SHELL<CR>", {silent = true})
--
-- Rempas the ctrl-w key to <leader> w
map("n", "<leader>w", "<C-w>", opt)

-- Misc
map("n", "<leader>f", ":FixWhitespace<CR>", {silent = true})
map("n", "<F3>", ":set spell!<CR>", {silent = true})
map("n", "<leader>m", ":ShowMarksOnce<CR>", {silent = true})
map("n", "<leader>cpp", ":-1read $HOME/Templates/C++/C++_Template.cpp<CR>Gdd3k", opt)
map("n", "<leader>html", ":-1read $HOME/Templates/HTML/HTML_Template.html<CR>Gdd2k", opt)
map("n", "<leader>c", ":-1read $HOME/Templates/C/C_Template.c<CR>Gdd3k", opt)
map("n", "<leader>tex", ":-1read $HOME/Templates/LaTex/LaTex_Template.tex<CR>Gdd3kdd", opt)
map("n", "<leader>mla", ":-1read $HOME/Templates/LaTex/LaTex_Template_MLA.tex<CR>75j", opt)

map("n", "<leader>s", ":w<CR>", opt)
map("n", "<leader>x", ":x<CR>", opt)
map("n", "<leader>q", ":q<CR>", opt)
map("n", "<leader>nt", ":tabnew<CR>", opt)

-- Remap <Esc> to jk
map ("i", "jk", "<Esc>")


-- Swap v and CTRL-V

map("n", "v", "<C-V>", opt)
map("n", "<C-V>", "v", opt)
map("v", "v", "<C-V>", opt)
map("v", "<C-V>", "v", opt)



-- Blink the line containing the match...
vim.cmd([[
function! HLNext (blinktime)
    set invcursorline
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
    set invcursorline
    redraw
endfunction]])

map("n", "n", "n:call HLNext(0.4)<cr>", {silent = true})
map("n", "N", "N:call HLNext(0.4)<cr>", {silent = true})


vim.cmd([[
function! ShowDigraphs ()
    digraphs
    call getchar()
    return "\<C-K>"
endfunction]])
-- Make CTRL-K list diagraphs before each digraph entry

-- This doesn't show the popup, you just type the keys for
-- the character you want
map("i", "<d-k", "call ShowDigraphs()<cr>", {expr = true})

map("n", "<leader>C", ":Compile<CR>", opt)
