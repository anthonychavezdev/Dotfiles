" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝



" See :help runtimepath and :help packpath
" for more information on these variables
set runtimepath+=~/.config/nvim,~/.config/nvim/after
set packpath+=~/.config/nvim

" Mappings for :terminal

if exists('g:vscode')
    " VSCode extensions
    source /home/anthony/.config/nvim/vscode.vim
else
    " Neovim Extensions
" <C-\><C-n> key stroke is used to switch to
" nomral mode in the Neovim Terminal.
" I want to just hit escape, or jk though.
:tnoremap <Esc> <C-\><C-n>
:tnoremap jk <C-\><C-n>

" If the compatible setting is set,
" change it to nocampatible.
" This is used for legacy systems,
" and aren't needed for modern machines.
if &compatible
 set nocompatible
endif

" Plugins
lua << EOF
require('plugins')
EOF
"Misc settigns
filetype plugin indent on

" Syntax highlighting
syntax on

" GUI
" Gonvim
" Plugin 'dzhou121/gonvim-fuzzy'
" Plugin 'equalsraf/neovim-gui-shim'
"==============================

" Correct RGB escape codes for (Neo)vim inside tmux
if $TERM == "xterm-256color" || $TERM == "screen-256color"
    " Use 256 colors in terminal
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
    set termguicolors
else
    set notermguicolors
endif
if !has('nvim') && $TERM ==# 'screen-256color'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

"==============================
" Colorschemes

" colo bluez
" colo bocau
" colo jellybeans
" colo candycode
" colo janah
" colo wal
" colo vividchalk
" colo gruvbox
" colo xoria256
" colo wombat256
" colo inkpot
" colo dracula
" TEMPUS COLOR SCHEMES
"==============================
" colo tempus_warp
" colo tempus_autumn
"==============================
" colo desert
" colo ir_black
" colo molokai
" colo murphy
" colo slate
" colo blackboard
" colo blazer
" colo cobalt2
" colo gardener
" colo dante
" From https://github.com/tomasr/molokai
colo molokai
let g:rehash256 = 1
" colo distinguished
" colo colorful256
"==============================

" Have Vim load indentation rules, filetype detection, and plugins
filetype plugin indent on
" Automatically indents lines according to previous indent
set autoindent
" Tab is spaces instead of a single tab character
set expandtab
" Tabs are viewed as 4 spaced
set tabstop=4
" Tabs are inserted as 4 spaces
set softtabstop=4
" Auto tabbing uses 4 spaces
set shiftwidth=4
" Context sensitive indentation (e.g. Indent again after { or )
set smartindent
" When a file has been detected to have been changed outside of Vim and it has not been changed inside of Vim, automatically read it again.
set autoread
" Show line numbers
set number
set numberwidth=1
" Show distance instead of absolute numbers
set relativenumber
" When 'wildmenu' is on, command-line completion operates in an enhanced mode.
set wildmenu
" highlight search matches
set hlsearch
" highlight search matches and move to them as they're being typed
set incsearch
" When this option is set, the screen will not be redrawn while
" executing macros, registers and other commands that have not been
" typed.  Also, updating the window title is postponed.  To force an
" update use |:redraw|.
set lazyredraw
" Show matching brackets.
set showmatch
" Tenths of a second to show the matching paren
set matchtime=3
" Enable supprt for unicode characters
set encoding=utf8
" Set colors to match a dark background
set background=dark
" If on, Vim will wrap long lines at a character in 'breakat' rather
" than at the last character that fits on the screen.  Unlike
" 'wrapmargin' and 'textwidth', this does not insert <EOL>s in the file,
" it only affects the way the file is displayed, not its contents.
set linebreak
" Allows you to CTRL-C in another program, paste it into Neovim
" and copy stuff from vim, and paste it into other programs
" while on Linux, Windows, and Mac OS.
set clipboard=unnamedplus
" Disabled status line.
" Always show status bar
set laststatus=2
 " Update mode quicker
set timeoutlen=500
" The next three just remove a bunch of repeated info from the command line
" If in Insert, Replace or Visual mode put a message on the last line.
set noshowmode
" Show the line and column number of the cursor position, separated by a
" comma.  When there is room, the relative position of the displayed
" text in the file is shown on the far right:
" 	Top	first line is visible
" 	Bot	last line is visible
" 	All	first and last line are visible
" 	45%	relative position in the file
set noruler
" set noshowcmd
set cmdheight=2
" See :help shortmess for the meaning
" of the letters below.
set shortmess=aIc
set scrolloff=0
set visualbell
set history=1000
set undolevels=10000
set mouse=n
" treat dash separated words as a word text object
set iskeyword+=-
" should make scrolling faster
set ttyfast
" set where swap file and undo/backup files are saved
set backupdir=~/.config/nvim/tmp,.
set directory=~/.config/nvim/tmp,.
" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow
" If in this many milliseconds, nothing is typed,
" the swap file will be written to disk
set updatetime=300
" Settings for autocompletion menu
" See :help completeopt
set completeopt=menuone,preview,noinsert
hi Pmenu ctermbg=Black
hi Pmenu ctermfg=White
hi PmenuSel ctermbg=Black
hi PmenuSel ctermfg=Red
" Same colors for gui or when termguicolors is enabled
hi Pmenu guibg=Black
hi Pmenu guifg=White
hi PmenuSel guibg=Black
hi PmenuSel guifg=Red

" Set vim to save the file on focus out.
au FocusLost * :wa
" Redraw screen every time when focus gained
au FocusGained * :redraw!
" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =


"set  rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/

set path+=**

"========== SrtNotes ==========
"
"	ctrl-a increases number by 1
"	ctrl-x dicreases number by 1
"
"========== EndNotes ==========


"==============================

" Key mapping
let mapleader = " "
let g:mapleader = " "
map j gj
map k gk
map <leader>d :Goyo<cr>

" for creating and moving between tags.
nnoremap <leader>tn :tnext<CR>
nnoremap <leader>tp :tprev<CR>
nnoremap <leader>tj :tjump<CR>
nmap <leader>en :lnext<CR>
nmap <leader>ep :lprevious<CR>
nmap <leader>tb :TagbarToggle<CR>

" For moving between buffers
nnoremap <silent> [b :bprev<CR>
nnoremap <silent> ]b :bnext<CR>

" To quickly open a terminal split
nnoremap <silent> <leader>T :8sp term://$SHELL<CR>
" Misc
noremap <silent> <leader>f :FixWhitespace<CR>
nmap <silent> <F3> :set spell!<CR>
noremap <silent> <leader>m :ShowMarksOnce<CR>
nnoremap <leader>cpp :-1read $HOME/Templates/C++/C++_Template.cpp<CR>Gdd3k
nnoremap <leader>html :-1read $HOME/Templates/HTML/HTML_Template.html<CR>Gdd2k
nnoremap <leader>c :-1read $HOME/Templates/C/C_Template.c<CR>Gdd3k
nnoremap <leader>tex :-1read $HOME/Templates/LaTex/LaTex_Template.tex<CR>Gdd3kdd
nnoremap <leader>mla :-1read $HOME/Templates/LaTex/LaTex_Template_MLA.tex<CR>75j

" Rempas the ctrl-w key to <leader> w
nnoremap <leader>w <C-w>
nnoremap <leader>s :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>nt :tabnew<CR>
inoremap jk <Esc>

" Swap v and CTRL-V
    nnoremap    v   <C-V>
    nnoremap <C-V>     v

    vnoremap    v   <C-V>
    vnoremap <C-V>     v

" ==============================

" PLUGINS
" ==============================
" colorscheme-switcher
lua << EOF
require('plugin-configs/colorscheme-switcher')
EOF
" ==============================

" Vimwiki
lua << EOF
require('plugin-configs/vimwiki')
EOF
"==============================

" nvim-tree
lua << EOF
require('plugin-configs/nvim-tree')
EOF
"==============================

" Galaxyline
lua << EOF
require('plugin-configs/galaxyline')
EOF
"==============================

    " This rewires n and N to do the highlighing...
    nnoremap <silent> n   n:call HLNext(0.4)<cr>
    nnoremap <silent> N   N:call HLNext(0.4)<cr>

    " Blink the line containing the match...
    function! HLNext (blinktime)
        set invcursorline
        redraw
        exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
        set invcursorline
        redraw
    endfunction

" Make CTRL-K list diagraphs before each digraph entry

" This doesn't show the popup, you just type the keys for
" the character you want
    inoremap <expr> <d-k> ShowDigraphs()

    function! ShowDigraphs ()
        digraphs
        call getchar()
        return "\<C-K>"
    endfunction

"==============================
runtime plugins/dragvisuals/dragvisuals.vim

vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()

" Remove any introduced trailing whitespace after moving...
let g:DVB_TrimWS = 1

"==============================

" tagbar

 let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
" ==============================

" Vimtex
lua << EOF
require('plugin-configs/vimtex')
EOF
" ==============================

" Startify Section
let g:startify_files_number = 8
let g:startify_update_oldfiles = 1
let g:startify_session_autoload = 1
let g:startify_change_to_dir = 1
let g:startify_fortune_use_unicode = 1
let g:ascii = [
            \' _______                ___ ___  __ ',
            \'|    |  |.-----..-----.|   |   ||__|.--------. ',
            \'|       ||  -__||  _  ||   |   ||  ||        |   ',
            \'|__|____||_____||_____| \_____/ |__||__|__|__|   ',
            \]
let g:startify_custom_header = 'map(g:ascii + startify#fortune#boxed(), "\"   \".v:val")'
let g:startify_bookmarks = [ {'v': '~/.vimrc'}, '~/.zshrc' ]
let g:startify_commands = [ {'t': ['Open a new Terminal', ':terminal']} ]
let g:startify_lists = [
            \ { 'type': 'files',     'header': ['   My most recently used files:'] },
            \ { 'type': 'dir',       'header': ['   My most recently used files in the current directory: '. getcwd()] },
            \ { 'type': 'sessions',  'header': ['   Sessions:']       },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks:']      },
            \ { 'type': 'commands',  'header': ['   Commands:']       },
            \ ]

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
" ==============================

" Native LSP
lua << EOF
require('plugin-configs/lsp')
EOF
" ==============================

" nvim-compe
" This is configured in Lua.
" I should probably switch to it
" for my config at some point
lua << EOF
require('plugin-configs/nvim-compe')
EOF
" ==============================
" Language servers/lspconfig
lua << EOF
require('plugin-configs/lspconfig-language-servers-setup')
EOF
" ==============================
" treesitter
lua << EOF
require('plugin-configs/treesitter')
EOF
" ==============================

" vim-vsnip
lua << EOF
require('plugin-configs/vim-vsnip')
EOF
" ==============================

" tex-conceal
" Config in ~/.config/nvim/after/ftplugin/tex.vim
"
" ==============================
" Reload init.vim
autocmd bufwritepost ~/.config/nvim/init.vim source $MYVIMRC
" nnoremap <Leader>hl :set cursorline! cursorcolumn!<CR>
" nnoremap <Leader>hl :set cursorline!<CR>
" ==============================

" ==============================

" ==============================
" Misc

" Compiling and/or running
autocmd Filetype rmd command! Compile :silent exec"!echo<space>\"require('rmarkdown');<space>render('%','pdf_document')\"<space>|<space>R<space>--vanilla > /tmp/rmarkdown.output && ~/scripts/Launch_MuPDF.sh %:r.pdf &"
autocmd Filetype c command! Compile !gcc "%" -o %:r
autocmd Filetype cpp command! Compile !g++ "%" -o %:r
autocmd Filetype tex command! Pdf !zathura "%" %:r.pdf
autocmd Filetype kotlin comman! Compile !kotlinc -include-runtime "%" -d %:r.jar

nnoremap <leader>C :Compile<CR>
" ==============================

" IndentLine
" let g:indentLine_char= '┊'
" ==============================

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

" Spell checking
autocmd FileType tex,gitcommit,text,markdown setlocal spell

augroup hlasmdetect
    au! BufRead,BufNewFile *.jcl set filetype=hlasm
augroup END

autocmd TermOpen term://* startinsert


" Commands
" ==============================

" Force Saving Files that Require Root Permission

" command! Sudowrite w !sudo tee % > /dev/null

" ==============================

" Saves folding in the current open file when exiting or switching windows.
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
" ===============================
end
