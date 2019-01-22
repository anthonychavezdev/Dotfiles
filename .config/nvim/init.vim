" ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
" ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
" ██║   ██║██║██╔████╔██║██████╔╝██║
" ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"   ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝



set runtimepath+=~/.config/nvim,~/.config/nvim/after
set packpath+=~/.config/nvim
:tnoremap <Esc> <C-\><C-n>
:tnoremap jk <C-\><C-n>
if &compatible
 set nocompatible
endif

" Plugins
call plug#begin('~/.config/nvim/plugins/')
    if has('nvim')
      Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
      Plug 'Shougo/deoplete.nvim'
      Plug 'roxma/nvim-yarp'
      Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug  'maxbrunsfeld/vim-yankstack'
    Plug  'vim-airline/vim-airline'
    Plug  'vim-airline/vim-airline-themes'
    Plug  'xolox/vim-misc'
    Plug  'xolox/vim-colorscheme-switcher'
    Plug  'bronson/vim-trailing-whitespace'
    Plug  'tpope/vim-surround'
    Plug  'vimwiki/vimwiki'
    " Plug  'ying17zi/vim-live-latex-preview'
    Plug  'file:///home/anthony/Instantly_Better_Vim_2013/plugin/dragvisuals'
    Plug  'junegunn/goyo.vim'
    Plug  'jiangmiao/auto-pairs'
    Plug  'tomtom/tlib_vim'
    Plug  'MarcWeber/vim-addon-mw-utils'
    Plug  'pangloss/vim-javascript'
    Plug  'garbas/vim-snipmate'
    Plug  'honza/vim-snippets'
    Plug  'ervandew/supertab'
    Plug  'vim-syntastic/syntastic'
    Plug 'rust-lang/rust.vim'
    Plug  'jacquesbh/vim-showmarks'
    Plug  'majutsushi/tagbar'
    Plug  'gregsexton/MatchTag'
    Plug  'udalov/kotlin-vim'
    " Plug  'dracula/vim'
    Plug 'calviken/vim-gdscript3'
    Plug  'protesilaos/tempus-themes-vim'
    " Plug  'octol/vim-cpp-enhanced-highlight'
    Plug  'tpope/vim-commentary'
    " Plug  'morhetz/gruvbox'
    Plug  'tpope/vim-rails'
    Plug 'scrooloose/nerdtree'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'justinmk/vim-syntax-extra'
    Plug 'mhinz/vim-startify'
    " Plug 'Yggdroot/indentline'
    Plug 'chrisbra/colorizer'
    Plug 'iamcco/markdown-preview.vim'
    Plug 'lervag/vimtex'
    Plug 'aclements/latexrun'

 if !has('nvim')
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'roxma/nvim-yarp'
 endif
    Plug 'w0rp/ale'
    Plug 'godlygeek/tabular'
    Plug 'ryanoasis/vim-devicons'
 call plug#end()


"Misc settigns
filetype plugin indent on

" Syntax highlighting
syntax enable

" GUI
" Gonvim
" Plugin 'dzhou121/gonvim-fuzzy'
" Plugin 'equalsraf/neovim-gui-shim'
"==============================


"==============================
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
colo blazer
" colo cobalt2

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
set matchtime=3
set mat=2
" Enable supprt for unicode characters
set encoding=utf-8
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
 " Use 256 colors in terminal
set t_Co=256
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
set noshowcmd
set cmdheight=1
set shortmess=a
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

" Enables true color if available
" if has("termguicolors")
"     set termguicolors
" endif
" Set the colorscheme to gruvbox (all gruvbox options must come before
" colorscheme gruvbox)
" let g:gruvbox_contrast_dark='hard'
" let g:gruvbox_italic=0
" colorscheme gruvbox
hi clear CursorLine
hi CursorLineNr cterm=bold
set cursorline

" Set vim to save the file on focus out.
au FocusLost * :wa
" Redraw screen every time when focus gained
au FocusGained * :redraw!
" Working with split screen nicely
" Resize Split When the window is resized"
au VimResized * :wincmd =

" Highlight line the cursor is on
" hi CursorLine   cterm=NONE ctermbg=230 ctermfg=black guibg=darkred guifg=white
"hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

"set  rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim/

set path+=**

"========== SrtNotes ==========
"
"	ctrl-a increases number by 1
"	ctrl-x dicreases number by 1
"
"========== EndNotes ==========


"==============================

" PLUGINS
"==============================

" Vimwiki

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
"==============================

"NERDTree

let g:NERDTreeChDirMode = 2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face
"==============================

" Deoplete

let g:deoplete#enable_at_startup = 1
highlight Pmenu ctermbg=232 guibg=#202020
highlight Pmenu ctermfg=White guibg=#202020
highlight PmenuSel ctermbg=235 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSel ctermfg=202 guifg=#dddd00 guibg=#1f82cd
highlight PmenuSbar ctermbg=237 guibg=#d6d6d6
"==============================

" Vim-Yankstack

call yankstack#setup()
let g:yankstack_yank_keys = ['y', 'd']
let g:yankstack_map_keys = 0
 nmap <Leader>p <Plug>yankstack_substitute_older_paste
 nmap <Leader>P <Plug>yankstack_substitute_newer_paste
"==============================

" Airline

let g:airline_powerline_fonts = 1
let g:airline_theme = 'serene'
" let g:airline_theme = 'simple'
" let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'gruvbox'
let g:airline_exclude_preview = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline#extensions#whitespace#enabled = 0
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

    inoremap <expr> <C-k> ShowDigraphs()

    function! ShowDigraphs ()
        digraphs
        call getchar()
        return "\<C-K>"
    endfunction

"==============================
runtime bundle/plugged/dragvisuals/dragvisuals.vim

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
"==============================

" LanguageClient

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
"==============================

" Key mapping
let mapleader = ","
let g:mapleader = ","
map j gj
map k gk
map <leader>d :Goyo<cr>
" for creating and moving between tabs.
nnoremap <leader>tn :tnext<CR>
nnoremap <leader>tp :tprev<CR>
nnoremap <leader>tj :tjump<CR>
nmap <leader>en :lnext<CR>
nmap <leader>ep :lprevious<CR>
nmap <leader>tb :TagbarToggle<CR>
noremap <leader>n :NERDTreeToggle .<CR>
noremap <leader>t :NERDTreeFocus<CR>
noremap <silent> <leader>f :FixWhitespace<CR>
nmap <silent> <F2> :set spell!<CR>
noremap <silent> <leader>m :ShowMarksOnce<CR>
nnoremap <leader>cpp :-1read $HOME/Templates/C++/C++_Template.cpp<CR>6j
nnoremap <leader>html :-1read $HOME/Templates/HTML/HTML_Template.html<CR>Gdd2k
nnoremap <leader>c :-1read $HOME/Templates/C/C_Template.c<CR>4j
nnoremap <leader>tex :-1read $HOME/Templates/LaTex/LaTex_Template.tex<CR>4j
nnoremap <leader>mla :-1read $HOME/Templates/LaTex/LaTex_Template_MLA.tex<CR>75j
" Rempas the ctrl-w key to <leader> w
nnoremap <leader>w <C-w>
nnoremap <leader>s :w<CR>
nnoremap <leader>x :x<CR>
nnoremap <leader>q :q<CR>
" Navigate to \"<++>"
" inoremap <Tab><Tab> <Esc>/<++><CR>"_c4l
nnoremap nt :tabnew<CR>
inoremap jk <Esc>

" Swap v and CTRL-V
    nnoremap    v   <C-V>
    nnoremap <C-V>     v

    vnoremap    v   <C-V>
    vnoremap <C-V>     v
nmap <F8> :NextColorScheme<CR>
nmap <F7> :PrevColorScheme<CR>

" Reload init.vim
autocmd bufwritepost ~/.config/nvim/init.vim source $MYVIMRC
" nnoremap <Leader>hl :set cursorline! cursorcolumn!<CR>
" nnoremap <Leader>hl :set cursorline!<CR>
" ==============================

" .html
autocmd FileType html inoremap <leader>1 <h1></h1><Esc>o <++><Esc>kF>a
autocmd FileType html inoremap <leader>2 <h2></h2><Esc>o <++><Esc>kF>a
autocmd FileType html inoremap <leader>3 <h3></h3><Esc>o <++><Esc>kF>a
autocmd FileType html inoremap <leader>4 <h4></h4><Esc>o <++><Esc>kF>a
autocmd FileType html inoremap <leader>5 <h5></h5><Esc>o <++><Esc>kF>a
autocmd FileType html inoremap <leader>6 <h6></h6><Esc>o <++><Esc>kF>a
autocmd FileType html inoremap <leader>nav <nav><CR><CR><Space><Space><Space><Space><ul><CR><CR><Space><Space><Space><Space><li><++></li><Esc>Y3p2jo<CR><Bs></ul><CR><CR></nav><Esc>7k0/<++><CR>"_c4l
autocmd FileType html inoremap <leader>ul <ul><CR><CR><Space><Space><Space><Space><li><++></li><Esc>Y3p2jo<CR><Bs></ul><Esc>5k0/<++><CR>"_c4l
autocmd FileType html inoremap <leader>a <a href="<++>"><++></a><Esc>o<++><Esc>ki
autocmd FileType html inoremap <leader>p <p></p><Esc>o<++><Esc>kF>a
" ==============================

".tex
autocmd FileType tex inoremap <leader>par \paragraph{}<Esc>o<Enter><++><Esc>2kf{a
autocmd FileType tex inoremap <leader>fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap <leader>fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <leader>exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap <leader>em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap <leader>bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap <leader>it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap <leader>ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap <leader>cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap <leader>glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap <leader>x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap <leader>ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <leader>ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap <leader>li <Enter>\item<Space>
autocmd FileType tex inoremap <leader>ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <leader>tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap <leader>ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap <leader>can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <leader>con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <leader>v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap <leader>a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap <leader>sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <leader>chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap <leader>st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap <leader>beg \begin{%DELRN%}<Enter><++><Enter>\end{%DELRN%}<Enter><Enter><++><Esc>4kfR:MultipleCursorsFind<Space>%DELRN%<Enter>c
"autocmd FileType tex inoremap ;up \usepackage{}<Esc>i
autocmd FileType tex inoremap <leader>up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex inoremap <leader>pkg <Esc>ggo\usepackage{}<Esc>i
autocmd FileType tex nnoremap <leader>up /usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap <leader>np <Esc>ggo\usepackage{}<Esc>i
autocmd FileType tex inoremap <leader>tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap <leader>bt {\blindtext}
autocmd FileType tex inoremap <leader>nu $\varnothing$
autocmd FileType tex inoremap <leader>col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap <leader>rn (\ref{})<++><Esc>F}i
autocmd FileType tex inoremap <leader>me \(\)<Esc>hi
autocmd FileType tex inoremap <leader>cme \[\]<Esc>hi
" ==============================

".bib
autocmd FileType bib inoremap <leader>a @article{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>journal<Space>=<Space>"<++>",<Enter><Tab>volume<Space>=<Space>"<++>",<Enter><Tab>pages<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap <leader>b @book{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap <leader>c @incollection{<Enter><Tab>author<Space>=<Space>"<++>",<Enter><Tab>title<Space>=<Space>"<++>",<Enter><Tab>booktitle<Space>=<Space>"<++>",<Enter><Tab>editor<Space>=<Space>"<++>",<Enter><Tab>year<Space>=<Space>"<++>",<Enter><Tab>publisher<Space>=<Space>"<++>",<Enter><Tab>}<Enter><++><Esc>8kA,<Esc>i
" ==============================

".c
autocmd Filetype c inoremap <leader>f for (int i = 0; i<++>; i<++>)<CR>{<CR>}<Esc>O<Esc>o<Esc>i    <++><Esc>o<Esc>4kFfi

autocmd Filetype c inoremap <leader>w while (<++>)<CR>{<CR>}<Esc>O<Esc>o<Esc>i    <++><Esc>o<Esc>4kFwi

autocmd Filetype c inoremap <leader>if if (<++>)<CR>{<CR>}<Esc>O<Esc>o<Esc>i    <++><Esc>o<Esc>4kFii
" ==============================

" Compiling and/or running
autocmd Filetype rmd command! Compile :silent exec"!echo<space>\"require('rmarkdown');<space>render('%','pdf_document')\"<space>|<space>R<space>--vanilla > /tmp/rmarkdown.output && ~/scripts/Launch_MuPDF.sh %:r.pdf &"
autocmd Filetype c command! Compile !gcc "%" -o %:r
autocmd Filetype cpp command! Compile !g++ "%" -o %:r
autocmd Filetype tex command! Pdf !zathura "%" %:r.pdf
autocmd Filetype kotlin comman! Compile !kotlinc -include-runtime "%" -d %:r.jar
" ==============================

" IndentLine
" let g:indentLine_char= '┊'
" ==============================

" Vimtex
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_view_automatic = 1
" ==============================

" Startify Section:
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

"" Disable conceal in Latex files ("Hiding tag"):
let g:tex_conceal = ''

" Commands

" ==============================

" Force Saving Files that Require Root Permission

" command! Sudowrite w !sudo tee % > /dev/null

" ==============================

" Saves folding in the current open file when exiting or switching windows.
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview