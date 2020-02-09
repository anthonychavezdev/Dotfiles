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
    " Plug 'maxbrunsfeld/vim-yankstack'

    " Use release branch
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Plug 'lifepillar/vim-mucomplete'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'xolox/vim-colorscheme-switcher'
    Plug 'xolox/vim-misc'

    Plug 'bronson/vim-trailing-whitespace'
    Plug 'tpope/vim-surround'
    Plug 'vimwiki/vimwiki'
    Plug 'file:///home/anthony/Instantly_Better_Vim_2013/plugin/dragvisuals'
    Plug 'junegunn/goyo.vim'
    Plug 'jiangmiao/auto-pairs'
    " Plug 'tomtom/tlib_vim'
    " Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'pangloss/vim-javascript'
    " Plug 'ervandew/supertab'
    " Plug 'vim-syntastic/syntastic'
    Plug 'rust-lang/rust.vim'
    Plug 'jacquesbh/vim-showmarks'
    Plug 'majutsushi/tagbar'
    " Matches HTML tags
    Plug 'gregsexton/MatchTag'

    Plug 'udalov/kotlin-vim'
    " Plug 'dracula/vim'
    Plug 'calviken/vim-gdscript3'
    " Plug 'protesilaos/tempus-themes-vim'
    Plug 'tpope/vim-commentary'
    " Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-rails'
    Plug 'scrooloose/nerdtree'

    " Handled by Coc.nvim
    " This isn't needed anymore.
    " Plug 'autozimu/LanguageClient-neovim', {
    "     \ 'branch': 'next',
    "     \ 'do': 'bash install.sh',
    "     \ }
    Plug 'junegunn/fzf'

    Plug 'justinmk/vim-syntax-extra'
    Plug 'mhinz/vim-startify'
    " Plug 'Yggdroot/indentline'
    Plug 'iamcco/markdown-preview.vim'
    Plug 'lervag/vimtex'
    Plug 'aclements/latexrun'

    Plug 'godlygeek/tabular'
    Plug 'ryanoasis/vim-devicons'
    Plug 'mhinz/neovim-remote'
    Plug 'sirver/ultisnips'
    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}
 call plug#end()


"Misc settigns
filetype plugin indent on

" Syntax highlighting
syntax on

" GUI
" Gonvim
" Plugin 'dzhou121/gonvim-fuzzy'
" Plugin 'equalsraf/neovim-gui-shim'
"==============================

" Correct RGB escape codes for (neo)vim inside tmux
if $TERM == "xterm-256color"
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
colo dante

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
hi Pmenu ctermbg=black
hi Pmenu ctermfg=white
hi PmenuSel ctermbg=black
hi PmenuSel ctermfg=red
" Same colors for gui or when termguicolors is enabled
hi Pmenu guibg=black
hi Pmenu guifg=white
hi PmenuSel guibg=black
hi PmenuSel guifg=red

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
let mapleader = ","
let g:mapleader = ","
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
nnoremap nt :tabnew<CR>
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
nmap <F8> :NextColorScheme<CR>
nmap <F7> :PrevColorScheme<CR>
" ==============================

" Vimwiki

let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown', '.mkd': "markdown"}
"==============================

"NERDTree
nmap <leader>b :NERDTreeToggle .<CR>
nmap <leader>t :NERDTreeFocus<CR>

let g:NERDTreeChDirMode = 2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeDirArrowExpandable = "\u00a0" " make arrows invisible
let NERDTreeDirArrowCollapsible = "\u00a0" " make arrows invisible
let NERDTreeNodeDelimiter = "\u263a" " smiley face
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

" LanguageClient

" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['/usr/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/bin/pyls'],
    \ 'c': ['/usr/bin/cquery',
    \ '--log-file=/tmp/cquery.log',
    \'--init={"cacheDirectory":"/tmp/cquery/"}'],
    \ }
nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> <leader>h :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" ==============================
" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
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

" Coc
" ==============================
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gtd <Plug>(coc-definition)
nmap <silent> gty <Plug>(coc-type-definition)
nmap <silent> gti <Plug>(coc-implementation)
nmap <silent> gtr <Plug>(coc-references)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>fmt  <Plug>(coc-format-selected)
nmap <leader>fmt  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" ==============================

" ultisnips
let g:UltiSnipsExpandTrigger = '<d-space>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
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

" Commands
" ==============================

" Force Saving Files that Require Root Permission

" command! Sudowrite w !sudo tee % > /dev/null

" ==============================

" Saves folding in the current open file when exiting or switching windows.
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview
