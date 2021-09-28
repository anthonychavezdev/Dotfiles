local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" then
        scopes["o"][key] = value
    end
end

vim.cmd("set guifont=Hack:h15")
-- See :help runtimepath and :help packpath
-- for more information on these variables
vim.cmd([[set runtimepath+=~/.config/nvim,~/.config/nvim/after]])
vim.cmd([[set packpath+=~/.config/nvim]])


if (vim.o.compatible == true)
    then
        opt("o", "compatible", false)
    end


vim.cmd[[filetype plugin indent on]]
-- Syntax highlighting
vim.cmd[[syntax on]]

-- Correct RGB escape codes for (Neo)vim inside tmux
-- Use 256 colors in terminal
if (vim.env.TERM == "xterm-256color" or vim.env.TERM == "screen-256color")
    then
        -- Use 256 colors in terminal
        vim.cmd[[
	set t_Co=256
        set t_AB=^[[48;5;%dm
        set t_AF=^[[38;5;%dm
        set termguicolors
	]]
else
    vim.cmd[[set notermguicolors]]
end


-- Automatically indents lines according to previous indent
opt("o", "autoindent", true)
-- Stops Vim from stopping the switching of buffers
-- when there are unsaved changes.
opt("o", "hidden", true)
-- Tab is spaces instead of a single tab character
opt("b", "expandtab", true)
-- Tabs are viewed as 4 spaced
opt("b", "tabstop", 4)
-- Tabs are inserted as 4 spaces
opt("b", "softtabstop", 4)
-- Auto tabbing uses 4 spaces
opt("b", "shiftwidth", 4)
-- Context sensitive indentation (e.g. Indent again after { or )
opt("b", "smartindent", true)
-- When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
opt("o", "autoread", true)
-- Show line numbers
opt("o", "number", true)
opt("w", "number", true)
opt("o", "numberwidth", 1)
opt("w", "numberwidth", 1)
-- Show distance instead of absolute numbers
opt("o", "relativenumber", true)
opt("w", "relativenumber", true)
-- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
opt("o", "wildmenu", true)
-- highlight search matches
opt("o", "hlsearch", true)
-- highlight search matches and move to them as they're being typed
opt("o", "incsearch", true)
-- When this option is set, the screen will not be redrawn while
-- executing macros, registers and other commands that have not been
-- typed.  Also, updating the window title is postponed.  To force an
-- update use |:redraw|.
opt("o", "lazyredraw", true)
-- Show matching brackets.
opt("o", "showmatch", true)
-- Tenths of a second to show the matching paren
opt("o", "matchtime", 3)
-- Enable supprt for unicode characters
opt("o", "encoding", "utf8")
-- Set colors to match a dark background
opt("o", "background", "dark")
-- If on, Vim will wrap long lines at a character in 'breakat' rather
-- than at the last character that fits on the screen.  Unlike
-- 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
-- it only affects the way the file is displayed, not its contents.
opt("o", "linebreak", true)
-- Allows you to CTRL-C in another program, paste it into Neovim
-- and copy stuff from vim, and paste it into other programs
-- while on Linux, Windows, and Mac OS.
opt("o", "clipboard", "unnamedplus")
-- Disabled status line.
-- Always show status bar
opt("o", "laststatus", 2)
-- Update mode quicker
opt("o", "timeoutlen", 500)
-- The next three just remove a bunch of repeated info from the command line
-- If in Insert, Replace or Visual mode put a message on the last line.
opt("o", "showmode", false)
-- Show the line and column number of the cursor position, separated by a
-- comma.  When there is room, the relative position of the displayed
-- text in the file is shown on the far right:
-- 	Top	first line is visible
-- 	Bot	last line is visible
-- 	All	first and last line are visible
-- 	45%	relative position in the file
opt("o", "ruler", false)
-- set noshowcmd
opt("o", "cmdheight", 2)
-- See :help shortmess for the meaning
-- of the letters below.
opt("o", "shortmess", "aIc")
opt("o", "scrolloff", 0)
opt("o", "visualbell", false)
opt("o", "history", 1000)
opt("o", "undolevels", 10000)
opt("o", "mouse", "n")
-- treat dash separated words as a word text object
vim.cmd("set iskeyword+='-'")
-- should make scrolling faster
opt("o", "ttyfast", true)
-- set where swap file and undo/backup files are saved
opt("o", "backupdir", "~/.config/nvim/tmp,.")
opt("o", "directory", "~/.config/nvim/tmp,.")
-- Open new split panes to right and bottom, which feels more natural
opt("o", "splitright", true)
opt("o", "splitbelow", true)
-- If in this many milliseconds, nothing is typed,
-- the swap file will be written to disk
opt("o", "updatetime", 300)
-- Settings for autocompletion menu
-- See :help completeopt
opt("o", "completeopt", "menuone,preview,noinsert,noselect")

vim.cmd("set path+='**'")

opt("w", "signcolumn", "auto")

-- Use treesitter for folding
-- opt("w", "foldmethod", "expr")
-- opt("w", "foldexpr", "nvim_treesitter#foldexpr()")
