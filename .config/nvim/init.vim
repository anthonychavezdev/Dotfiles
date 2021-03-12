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
" I don't remember why I mapped
" <Esc> like that
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
call plug#begin('~/.config/nvim/plugins/')
    " Coc is an intellisense engine for Vim/Neovim.
    " Use release branch
    " Switched to native LSP in the 0.5 nightly build
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Plug 'lifepillar/vim-mucomplete'

    " Native LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'

    " This is that bar at the bottom
    " I'm replacing this with galaxyline
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    " Replacing airline with this.
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}

    " Used to quickly switch colorschemes
    Plug 'xolox/vim-colorscheme-switcher'
    " Used by vim-colorscheme-switcher
    Plug 'xolox/vim-misc'

    " This plugin causes trailing whitespace to be highlighted in red.
    " To delete the trailing whitespace, call :FixWhitespace
    Plug 'bronson/vim-trailing-whitespace'
    " Surround.vim is all about \"surroundings\": parentheses, brackets,
    " quotes, XML tags, and more. The plugin provides mappings to easily
    " delete, change and add such surroundings in pairs.
    Plug 'tpope/vim-surround'

    " VimWiki is a personal wiki for Vim -- a number of linked text files
    " that have their own syntax highlighting
    "
    " With VimWiki you can:

    " Organize notes and ideas
    " Manage to-do lists
    " Write documentation
    " Maintain a diary
    " Export everything to HTML
    Plug 'vimwiki/vimwiki'

    " This plugin makes it possible to select
    " things in visual mode (Shifft+v, Ctrl+v, etc)
    " and move the selected item(s) around
    Plug 'file:///home/anthony/Instantly_Better_Vim_2013/plugin/dragvisuals'

    " Distraction-free writing in Vim.
    Plug 'junegunn/goyo.vim'

    " Insert or delete brackets, parens, quotes in pair.
    Plug 'jiangmiao/auto-pairs'

    " Plug 'tomtom/tlib_vim'
    " Plug 'MarcWeber/vim-addon-mw-utils'

    Plug 'pangloss/vim-javascript'

    " Plug 'ervandew/supertab'
    Plug 'rust-lang/rust.vim'

    " ShowMarks provides a visual representation of the location marks
    " See :help marks
    " or, https://vim.fandom.com/wiki/Using_marks
    Plug 'jacquesbh/vim-showmarks'

    " Tagbar is a Vim plugin that provides an easy way to browse the tags
    " of the current file and get an overview of its structure
    " bringing up tagbar shows you variables, and function names
    " on a side panel, and allows you to quickly jump to them
    Plug 'majutsushi/tagbar'

    " Matches HTML tags
    Plug 'gregsexton/MatchTag'

    Plug 'udalov/kotlin-vim'
    Plug 'dracula/vim', {'as': 'dracula'}
    " Adds syntax highlighting for gdscript3,
    " a programing language used by the
    " Godot game engine
    Plug 'calviken/vim-gdscript3'

    " Plug 'protesilaos/tempus-themes-vim'

    " Easily comment stuff out, or uncomment
    " them out.
    Plug 'tpope/vim-commentary'

    " Plug 'morhetz/gruvbox'

    Plug 'tpope/vim-rails'
    " Provides a file viewer on the left
    " side of the screen, like you'd get with
    " modern text editors
    Plug 'scrooloose/nerdtree'
    " Fuzzy finder, for quickly searching for files
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Extra syntax highlighting.
    " I don't remember what languages this was for.
    Plug 'justinmk/vim-syntax-extra'

    " The little starting page you get when you just run
    " (Neo)vim without any arguments
    Plug 'mhinz/vim-startify'
    " Plug 'Yggdroot/indentline'

    Plug 'iamcco/markdown-preview.vim'

    " LaTeX plugin
    Plug 'lervag/vimtex'
    Plug 'aclements/latexrun'

    " Helps with ligning up text
    Plug 'godlygeek/tabular'

    " Adds icons to files/filetypes
    " vim-devicons is stil used by
    " startify
    Plug 'ryanoasis/vim-devicons'
    Plug 'kyazdani42/nvim-web-devicons'

    Plug 'mhinz/neovim-remote'

    Plug 'sirver/ultisnips'

    Plug 'KeitaNakamura/tex-conceal.vim', {'for': 'tex'}

    " Floating terminal window
    Plug 'voldikss/vim-floaterm'
    " Git blame plugin
    Plug 'APZelos/blamer.nvim'
    " Only for nvim 0.5 Nightly
    Plug 'andweeb/presence.nvim'

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
noremap <silent> [b :bprev<CR>
noremap <silent> ]b :bnext<CR>
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

" let g:airline_powerline_fonts = 1
" let g:airline_theme = 'serene'
" let g:airline_theme = 'simple'
" let g:airline_theme = 'bubblegum'
" let g:airline_theme = 'gruvbox'
" let g:airline_exclude_preview = 1
" let g:airline#extensions#tabline#enabled = 1
" Shows the open buffers as tabs at the top of the
" window, but they still behave as buffers, they
" don't behave like tabs.
" That's a bit misleading, and I don't want that
" feature activated.
" let g:airline#extensions#tabline#show_buffers = 0
" Show bufffer numbers at the top of the screen
" instead
" let g:airline#extensions#tabline#buffer_nr_show = 1
" let g:airline#extensions#tabline#show_splits = 0
" let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#show_tab_nr = 0
" let g:airline#extensions#tabline#show_tab_type = 0
" let g:airline#extensions#tabline#show_close_button = 0

" let g:airline#extensions#whitespace#enabled = 0

"==============================
" Galaxyline
lua << EOF
local gl = require('galaxyline')
local colors = require('galaxyline.theme').default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.bg}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local mode_color = {n = colors.red, i = colors.green,v=colors.blue,
                          [''] = colors.blue,V=colors.blue,
                          c = colors.magenta,no = colors.red,s = colors.orange,
                          S=colors.orange,[''] = colors.orange,
                          ic = colors.yellow,R = colors.violet,Rv = colors.violet,
                          cv = colors.red,ce=colors.red, r = colors.cyan,
                          rm = colors.cyan, ['r?'] = colors.cyan,
                          ['!']  = colors.red,t = colors.red}
      vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color[vim.fn.mode()])
      return '  '
    end,
    highlight = {colors.red,colors.bg,'bold'},
  },
}
gls.left[3] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg}
  }
}
gls.left[4] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.left[5] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.magenta,colors.bg,'bold'}
  }
}

gls.left[6] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}

gls.left[7] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.bg}
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.yellow,colors.bg},
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.cyan,colors.bg},
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue,colors.bg},
  }
}

gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP:',
    highlight = {colors.cyan,colors.bg,'bold'}
  }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}

gls.right[3] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[4] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = {colors.violet,colors.bg,'bold'},
  }
}

gls.right[5] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.green,colors.bg},
  }
}
gls.right[6] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = {colors.orange,colors.bg},
  }
}
gls.right[7] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = {colors.red,colors.bg},
  }
}

gls.right[8] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
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

" " Coc
" " ==============================
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" " Use `[g` and `]g` to navigate diagnostics
" nmap <silent> [g <Plug>(coc-diagnostic-prev)
" nmap <silent> ]g <Plug>(coc-diagnostic-next)
" " Remap keys for gotos
" nmap <silent> <leader>gtd <Plug>(coc-definition)
" nmap <silent> <leader>gty <Plug>(coc-type-definition)
" nmap <silent> <leader>gti <Plug>(coc-implementation)
" nmap <silent> <leader>gtr <Plug>(coc-references)
" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" " Remap for format selected region
" xmap <leader>fmt  <Plug>(coc-format-selected)
" nmap <leader>fmt  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)

" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <leader>A  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <leader>E  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <leader>C  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <leader>O  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <leader>S  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <leader>J  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <leader>K  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <leader>P  :<C-u>CocListResume<CR>
" ==============================
" Native LSP
" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g] <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)
" ==============================

" nvim-compe
" This is configured in Lua.
" I should probably switch to it
" for my config at some point
lua << EOF
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    vsnip = true;
    nvim_lsp = true;
    nvim_lua = true;
    spell = true;
    tags = true;
    snippets_nvim = true;
    treesitter = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<TAB>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF
" ==============================
" Language servers
lua << EOF
local lspc = require'lspconfig'
    lspc.clangd.setup {
    on_attatch = on_attatch,
    init_options = {
        cmd = { "clangd", "--background-index" },
        filetypes = { "c", "cpp", "objc", "objcpp" }
    }
}
EOF
" ==============================

" ultisnips
" d-space is the super key and space
" if I'm remembering correctly.
let g:UltiSnipsExpandTrigger = '<d-space>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
" ==============================
" fzf
" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" Except for ctrl-q, this is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right

" You can set up fzf window using a Vim command (Neovim or latest Vim 8 required)
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10new' }
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8, 'highlight': 'Comment' } }

" Customize fzf colors to match your color scheme
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'

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
